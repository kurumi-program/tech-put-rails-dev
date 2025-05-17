# app/controllers/overrides/omniauth_callbacks_controller.rb
class Overrides::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
  def passthru
    render status: 404, plain: "Omniauth passthru"
  end

  def google_oauth2
    # 必要に応じてカスタマイズ。通常は super でOK。
    super
  end
end
