class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::Cookies

  # split_tokenは/authパスではスキップする
  before_action :split_token, unless: -> { request.path.start_with?('/auth') }

  # authenticate_user! が必要なら、同様に条件つけてください（今は呼ばれてないようですが）
  # before_action :authenticate_user!, unless: -> { request.path.start_with?('/auth') }

  private

  def split_token
    return if cookies["_access_token"].nil? || cookies["_client"].nil? || cookies["_uid"].nil?

    request.headers['access-token'] = cookies["_access_token"]
    request.headers['client'] = cookies["_client"]
    request.headers['uid'] = cookies["_uid"]
  end
end
