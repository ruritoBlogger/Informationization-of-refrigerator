class ApplicationController < ActionController::Base

  before_action :set_current_user
  before_action :set_today
  before_action :set_food

  #ログインユーザー
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  #時間の情報
  def set_today
    require "date"
    @today = Date.today
  end

  #アクセスの制限

  #ログインしているかどうかの判断
  def checkLogin
    if session[:user_id] == nil
      flash[:notice_fail] = "ログインを行ってください"
      redirect_to("/home/login")
    end
  end

  #ログイン中のユーザーに編集権限が存在するかどうかの判断
  def checkUser
    food = Food.find_by(id: params[:id])
    user = User.find_by(id: food.user_id)
    if user.id != session[:user_id]
      flash[:notice_fail] = "編集権限が存在しません"
      #ログインしているかどうかの判断
      if session[:user_id]
        redirect_to("/food/main")
      else
        redirect_to("/home/login")
      end
    end
  end

  #レベルの更新
  # 食べ物を使いきった時経験値を100上げてレベルアップの確認を行う

  def leveling()
    @user = User.find_by(id: session[:user_id])
    @user.exp += 100
    if @user.level < 10

      #レベルが10未満の時
      if @user.exp >= 300
        @user.level += 1
        @user.exp -= 300
      end

    elsif @user.level < 30

      #レベルが10以上30未満の時
      if @user.exp >= 500
        @user.level += 1
        @user.exp -= 500
      end

    else

      #レベルが30以上の時
      if user.exp >= 1000
        @user.level += 1
        @user.exp -= 1000
      end

    end
    @user.save
  end

  def set_food
    @food = Food.new
  end


end
