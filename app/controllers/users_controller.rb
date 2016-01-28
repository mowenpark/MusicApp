# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime
#  updated_at      :datetime
#

class UsersController < ApplicationController

  def index
    render :index
  end

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      raise "Hellll"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
