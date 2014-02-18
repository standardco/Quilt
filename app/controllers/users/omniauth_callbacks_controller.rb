class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def github
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_github_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      # if this is a "temp user" redirect to settings to finish reg
      if @user.is_temp_user == 1
        sign_in @user  #:event => :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
        redirect_to("/users/edit")
      else
        sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
      end

      
    else
      session["devise.github_data"] = request.env["omniauth.auth"]
      print(request.env["omniauth.auth"])
      redirect_to new_user_registration_url
    end
  end
end