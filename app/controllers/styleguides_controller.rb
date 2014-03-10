class StyleguidesController < ApplicationController
  before_action :set_styleguide, only: [:show, :edit, :update, :destroy]


  # GET /:user (/tjmule)
  # GET /styleguides
  # GET /styleguides.json
  def index
    @user = current_user
    @user_styleguides = Styleguide.where(:user_id => @user.id).order_by(:created_at => "desc")
    @public_styleguides = Styleguide.where(:is_public => "yes")
  end

  # GET /:user/:styleguide
  # GET /:user/:styleguide.json
  def show
  end

  # GET /:user/styleguides/new
  def new
    @user = current_user
    @styleguide = Styleguide.new
  end

  # GET /:user/:styleguide/edit
  def edit
  end

  # POST /:user/styleguides
  # POST /:user/styleguides.json
  def create
    @user = current_user
    @styleguide = @user.styleguides.create! styleguide_params

    respond_to do |format|
      if @styleguide.save
        format.html { redirect_to styleguide_path(@styleguide.user, @styleguide), notice: 'Styleguide was successfully created.' }
        format.json { render action: 'show', status: :created, location: @styleguide }
      else
        format.html { render action: 'new' }
        format.json { render json: @styleguide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /:user/:styleguide
  # PATCH/PUT /:user/:styleguide.json
  def update
    respond_to do |format|
      if @styleguide.update(styleguide_params)
        format.html { redirect_to styleguide_path, notice: 'Styleguide was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @styleguide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /:user/:styleguide
  # DELETE /:user/:styleguide.json
  def destroy
    @styleguide.destroy
    respond_to do |format|
      format.html { redirect_to styleguides_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_styleguide
      @user = current_user
      @styleguide = @user.styleguides.find params[:styleguide]
      # @styleguide = Styleguide.find(params[:styleguide])
      @owner = @styleguide.user
      @components = Component.where(styleguide_id: @styleguide.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def styleguide_params
      params.require(:styleguide).permit(:title, :user_id, :url, :description, :categories, :css_paths, :image_url, :is_public)
    end
end
