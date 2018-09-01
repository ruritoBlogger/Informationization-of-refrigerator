class UserController < ApplicationController
  def create
    @user = User.new(user_name: params[:name],
                     password: params[:password])
    @user.save
    flash[:notice] = "新規登録に成功しました"
    redirect_to("/main/profile")
  end
end
