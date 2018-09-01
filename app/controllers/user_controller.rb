class UserController < ApplicationController

  #新規登録
  def create
    @user = User.new(user_name: params[:name],
                     password: params[:password],
                     user_image: "default.jpg")
    @user.save
    session[:user_id] = @user.id
    flash[:notice] = "新規登録に成功しました"
    redirect_to("/main/profile")
  end

  #ログイン
  def login
    @user = User.find_by(user_name: params[:name],
                         password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインに成功しました"
      redirect_to("/main/profile")
    else
      flash[:notice_fail] = "ログインに失敗しました"
      redirect_to("/home/login")
    end
  end

  #ログアウト
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトに成功しました"
    redirect_to("/home/login")
  end

    def update
    @user = User.find_by(id: session[:user_id])
    @user.user_name = params[:name]
    @user.password = params[:password]
    @user.save
    flash[:notice] = "プロフィールを更新しました"
    redirect_to("/main/profile")
  end

end
