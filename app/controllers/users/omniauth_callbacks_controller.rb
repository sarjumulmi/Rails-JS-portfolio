class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

def all
  @user = User.from_omniauth(request.env["omniauth.auth"])
  if @user.persisted?
    flash.notice = "Sign in successful."
    sign_in(@user)
    redirect_to root_path
  else
    flash.notice = "Sign in unsuccessful."
    redirect_to new_user_registration_path
  end
end

alias_method :facebook, :all
alias_method :github, :all
end
