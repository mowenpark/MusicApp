class SessionsController < ApplicationController
  skip_before_filter :logged_in?

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params["email"], params["password"])
    session[:session_token] = @user.session_token
    redirect_to user_url(@user)
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to users_url
  end

end
