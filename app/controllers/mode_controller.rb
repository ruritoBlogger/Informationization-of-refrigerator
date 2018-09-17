class ModeController < ApplicationController


  #食品の種類を新規登録
  def createmode
    @mode = Mode.new(create_mode_params)
    @mode.user_id = session[:user_id]
    @mode.save
    flash[:notice] = "新しい食品の種類を登録しました"
    redirect_to("/food/main")
  end

  def create_mode_params
    params.require(:mode).permit(
        :detail,
    )
  end

  #新規登録した食品を種類と関連付ける
  def conectmode
    @conect_food_to_mode = ConectFoodToMode.new(mode_params)
    @conect_food_to_mode.food_id = session[:food_id]
    @conect_food_to_mode.user_id = session[:user_id]
    session[:food_id] = nil
    @conect_food_to_mode.save
    flash[:notice] = "食品の登録が成功しました"
    redirect_to("/food/main")
  end

  def mode_params
    params.require(:conect_food_to_mode).permit(
        :mode_id
    )
  end

  #食品の種類の一覧を表示するモード
  def editmode
    @mode = Mode.new
  end

  #新規登録した食品を種類と関連付けるページ
  def conect
    @conect_food_to_mode = ConectFoodToMode.new
    @modes = Mode.where(user_id: session[:user_id])
  end

end
