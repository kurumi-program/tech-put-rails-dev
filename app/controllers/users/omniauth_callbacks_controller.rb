class Users::OmniauthCallbacksController < ApplicationController
  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      
      @user.create_new_auth_token
      render json: @user, status: :ok
    else
     
      redirect_to new_user_registration_url
    end
  end
end
