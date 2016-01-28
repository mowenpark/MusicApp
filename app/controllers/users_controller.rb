class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(user)
      redirect_to
    else
      raise "Hellll"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
