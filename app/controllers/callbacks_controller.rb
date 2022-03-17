class CallbacksController < ApplicationController
  
  skip_before_action :authenticate_user!

  def github
    user = User.where(uid: auth_hash[:uid], provider: auth_hash[:provider]).first
    if user.present?
      sign_in_and_redirect user
    else
      user = User.new(
        provider: auth_hash["provider"],
        uid: auth_hash["uid"], 
        name: auth_hash["info"]["name"],
        email: auth_hash["info"]["email"], 
        password: auth_hash["uid"], 
        password_confirmation: auth_hash["uid"]
      )
      if user.save
        sign_in_and_redirect user
      else
        p user.errors
        redirect_to new_session_path
      end
    end
  end

  private
  def auth_hash
    request.env["omniauth.auth"]
  end
end