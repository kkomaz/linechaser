class SessionsController < ApplicationController
  def create
    @user = build_user(env["omniauth.auth"])
    if @user && @user.save
      login(@user)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Signed out!"
    redirect_to root_path
  end

  private
  def build_user(omni_hash)
    User.set_user(omni_hash)
  end
end