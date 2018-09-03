class UserController < ApplicationController

  #新規登録
  def create
    @user = User.new(user_name: params[:name],
                     password: params[:password],
                     image_name: "default.jpg",
                     level: 1,
                     exp: 0)
    @user.save
    system("cd ~/mysketch/Informationization-of-refrigerator/public/")
    system("mkdir food#{@user.id}_images")
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

  #プロフィールの更新
  def update
    @user = User.find_by(id: session[:user_id])
    @user.user_name = params[:name]
    @user.introduction = params[:introduction]

    #プロフィール画像の更新があった場合
    if params[:image_name]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image_name]
      File.binwrite("public/user_images/#{@user.image_name}",image.read)
    else
      #プロフィール画像の更新がないときはデフォルトの画像
      @user.image_name = "default.jpg"
    end

    @user.save
    flash[:notice] = "プロフィールを更新しました"
    redirect_to("/main/profile")
  end

  def updatepw
    @user = User.find_by(id: session[:user_id])
    @user.password = params[:password]
    @user.save
    flash[:notice] = "個人情報を更新しました"
    redirect_to("/main/setting")
  end

  #退会
  def destroy
    user = User.find_by(id: session[:user_id])
    user.destroy
    session[:user_id] = nil
    flash[:notice] = "退会しました"
    redirect_to("/home/login")
  end

end
