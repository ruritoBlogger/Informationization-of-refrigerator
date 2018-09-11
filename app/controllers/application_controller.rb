class ApplicationController < ActionController::Base



  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
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

end
