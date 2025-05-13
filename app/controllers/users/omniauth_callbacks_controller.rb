class Users::OmniauthCallbacksController < ApplicationController
  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      # トークンを生成してユーザーをサインイン
      @user.create_new_auth_token
      render json: @user, status: :ok
    else
      # ユーザー作成に失敗した場合
      redirect_to new_user_registration_url
    end
  end
end
