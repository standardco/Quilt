require 'open-uri'

class ComponentsController < ApplicationController
  before_action :set_component, only: [:show, :edit, :update, :destroy]
  before_action :set_styleguide
  before_filter :authenticate_user!
  # GET /components
  # GET /components.json
  def index
    @components = Component.all
  end

  # GET /components/1
  # GET /components/1.json
  def show
  end

  def 

  # GET /components/upload
  def upload
    # Add demo content for testing purposes.
    @demo = '<!-- quilt component -->
<button name="button-1">Click me</button>
<!-- quilt end -->

<!-- quilt component -->
<input name="checkbox-1" type="checkbox">
<!-- quilt end -->

<!-- quilt component -->
<select name="select-album">
  <option value="gish">Gish</option>
  <option value="siamese-dream">Siamese Dream</option>
  <option value="mellon-collie">Mellon Collie and the Infinite Sadness</option>
  <option value="adore">Adore</option>
</select>
<!-- quilt end -->'
  end

  # POST /components/upload
  def upload_html

    # Extract the quilt components.
    html = params[:html]
    index = 0
    html.scan(/<!-- quilt component -->(.*?)<!-- quilt end -->/m) do |match|
      index = index + 1
      puts "Component #{index}: \n" + match[0] + "\n"
    end

    respond_to do |format|
      format.html { render action: 'upload' }
    end
  end

  # GET /components/github
  def github
  end

  # GET /components/new
  def new
    @component = Component.new
    user_id = current_user.id

    #p 'asdfasdf'
    #@styleguides = Styleguide.where("user_id = ?", "adfasdfsf")
    #@styleguides = Styleguide.find_by user_id: user_id
    @styleguide_id = params[:id]
  end

  # GET /components/1/edit
  def edit
  end

  # POST /components
  # POST /components.json
  def create
    @user = current_user

    @component = Component.new(component_params)

    @component.user_id = @user.id
    @component.styleguide_id = params[:styleguide_id]

    respond_to do |format|
      if @component.save
        component_path = get_component_path
        
        format.html { redirect_to component_path, notice: 'Component was successfully created.' }
        format.json { render action: 'show', status: :created, location: @component }
      else
        format.html { render action: 'new' }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /components/1
  # PATCH/PUT /components/1.json
  def update
    respond_to do |format|
      if @component.update(component_params)
        component_path = get_component_path
        format.html { redirect_to component_path, notice: 'Component was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /components/1
  # DELETE /components/1.json
  def destroy
    @component.destroy
    respond_to do |format|
      format.html { redirect_to components_url }
      format.json { head :no_content }
    end
  end

  private
    def get_component_path
      #puts "this is the path" + @owner._slugs[0] + '/' + @styleguide._slugs[0] + '/' + @component._slugs[0]
      return '/' + @owner._slugs[0] + '/' + @styleguide._slugs[0] + '/' + @component._slugs[0]
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_component
      @component = Component.find(params[:component])
    end

    def set_styleguide

      styleguide_id = params[:styleguide]
      
      if (styleguide_id == nil)
        styleguide_id = params[:id]
      end

      if (styleguide_id == nil)
        styleguide_id = params[:styleguide_id]
      end

      styleguide_id = "52f685484a61720a75090000"
      @styleguide = Styleguide.find(styleguide_id)
      @owner = @styleguide.user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def component_params
      params.require(:component).permit(:title, :description, :notes, :dependencies, :code)
    end
end
