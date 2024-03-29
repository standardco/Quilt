class StyleguidesController < ApplicationController
  before_action :set_styleguide, only: [:show, :edit, :update, :destroy, :add_component]
  before_filter :authenticate_user!

  # GET /:user
  # GET /:user.json
  def index
    @user = current_user
    @public_styleguides = Array.new
    User.each do |user|
      user.styleguides.where(is_public: "yes").each do |styleguide|
        @public_styleguides << styleguide
      end
    end
  end

  # GET /:user/:styleguide
  # GET /:user/:styleguide.json
  def show
  end

  # GET /:user/styleguides/new
  def new
    @user = current_user
    @styleguide = @user.styleguides.new
  end

  # GET /:user/:styleguide/edit
  def edit
  end

  # POST /:user/styleguides
  # POST /:user/styleguides.json
  def create
    @user = current_user
    @styleguide = @user.styleguides.create! user_styleguide_params

    respond_to do |format|
      if @styleguide.save
        format.html { redirect_to add_component_path(@styleguide.user, @styleguide), notice: 'The styleguide was successfully created. Now, let\'s add some components!' }
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
      if @styleguide.update(user_styleguide_params)
        format.html { redirect_to user_styleguide_path(@styleguide.user, @styleguide), notice: 'Styleguide was successfully updated.' }
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
      format.html { redirect_to user_styleguides_url }
      format.json { head :no_content }
    end
  end

  # GET /:user/:styleguide/add-component
  def add_component

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_styleguide
      @user = User.find params[:user]
      @styleguide = @user.styleguides.find params[:styleguide]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_styleguide_params
      params.require(:styleguide).permit(:title, :user_id, :url, :description, :categories, :css_paths, :image_url, :is_public)
    end
end
