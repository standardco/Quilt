require 'open-uri'

class ComponentsController < ApplicationController
  before_action :set_component, only: [:show, :edit, :update, :destroy, :iframe]
  before_filter :authenticate_user!

  # GET /:user/:styleguide/:component
  # GET /:user/:styleguide/:component.json
  def show
    
  end



  def iframe
    render :layout => 'headerless'
  end

  # GET /:user/:styleguide/components/upload
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

  # POST /:user/:styleguide/components/upload_html
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

  # GET /:user/:styleguide/components/github
  def github
  end

  # GET /:user/:styleguide/components/new
  def new
    @user = current_user
    @styleguide = @user.styleguides.find params[:styleguide]
    @component = @styleguide.components.new
  end

  # GET /components/1/edit
  def edit
  end

  # POST /components
  # POST /components.json
  def create
    @user = current_user
    @styleguide = @user.styleguides.find params[:styleguide]
    @component = @styleguide.components.create! component_params

    respond_to do |format|
      if @component.save
        format.html { redirect_to component_path(@component.styleguide.user, @component.styleguide, @component), notice: 'Component was successfully created.' }
        format.json { render action: 'show', status: :created, location: @component }
      else
        format.html { render action: 'new' }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /:user/:styleguide/:component
  # PATCH/PUT /:user/:styleguide/:component.json
  def update
    respond_to do |format|
      if @component.update(component_params)
        format.html { redirect_to component_path(@component.styleguide.user, @component.styleguide, @component), notice: 'Component was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /:user/:styleguide/:component
  # DELETE /:user/:styleguide/:component.json
  def destroy
    @component.destroy
    respond_to do |format|
      format.html { redirect_to user_styleguide_path }
      format.json { head :no_content }
    end
  end

  private
    def set_component
      @user = User.find params[:user]
      @styleguide = @user.styleguides.find params[:styleguide]
      @component = @styleguide.components.find params[:component]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def component_params
      params.require(:component).permit(:title, :description, :notes, :dependencies, :code)
    end
end
