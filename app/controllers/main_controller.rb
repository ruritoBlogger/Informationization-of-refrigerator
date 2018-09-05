class MainController < ApplicationController

  #ユーザーのプロフィールページ
  def profile
    @user = User.find_by(id: session[:user_id])
  end

  #ユーザー名、自己紹介文、プロフィール画像の更新ページ
  def edit
    @user = User.find_by(id: session[:user_id])
    @user_name = @user.user_name
  end

  #設定ページ
  def setting
  end

  #パスワードの更新ページ
  def editpw
    @user = User.find_by(id: session[:user_id])
  end

  #ランキングページ
  def ranking
    @users = User.all
  end

end
