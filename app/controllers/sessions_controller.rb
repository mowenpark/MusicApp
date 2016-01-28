class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    session[:session_token] = current_user.reset_session_token!
    redirect_to user_url(current_user)
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to users_url
  end

end
