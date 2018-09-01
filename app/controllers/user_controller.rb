class UserController < ApplicationController
  def create
    @user = User.new(user_name: params[:name],
                     password: params[:password])
    @user.save
    redirect_to("/main/profile")
  end
end
