class MainController < ApplicationController

  def profile
    @user = User.find_by(id: session[:user_id])
  end

  def edit
    @user = User.find_by(id: session[:user_id])
    @user_name = @user.user_name
  end



end
