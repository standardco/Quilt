class StyleguidesController < ApplicationController
  before_action :set_styleguide, only: [:show, :edit, :update, :destroy]


  # GET /styleguides
  # GET /styleguides.json
  def index
    @styleguides = Styleguide.all
  end

  # GET /styleguides/1
  # GET /styleguides/1.json
  def show
  end

  # GET /styleguides/new
  def new
    @styleguide = Styleguide.new
  end

  # GET /styleguides/1/edit
  def edit
  end

  # POST /styleguides
  # POST /styleguides.json
  def create
    @styleguide = Styleguide.new(styleguide_params)
    @user = current_user
    @styleguide.user_id = @user.id

    respond_to do |format|
      if @styleguide.save
        format.html { redirect_to @styleguide, notice: 'Styleguide was successfully created.' }
        format.json { render action: 'show', status: :created, location: @styleguide }
      else
        format.html { render action: 'new' }
        format.json { render json: @styleguide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /styleguides/1
  # PATCH/PUT /styleguides/1.json
  def update
    respond_to do |format|
      if @styleguide.update(styleguide_params)
        format.html { redirect_to @styleguide, notice: 'Styleguide was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @styleguide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /styleguides/1
  # DELETE /styleguides/1.json
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
      @styleguide = Styleguide.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def styleguide_params
      params.require(:styleguide).permit(:title, :user_id)
    end
end