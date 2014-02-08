class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_devise_params, if: :devise_controller?
  before_filter :component_tags, :get_resources

  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:username, :email, :password, :password_confirmation)
    end
  end

  protected

  def component_tags
    #@styleguide = Styleguide.find(params[:styleguide])
    puts params
    puts "tjmueh"
  	@components = Component.all
  end
  def get_resources

  end

end
