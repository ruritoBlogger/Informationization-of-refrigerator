class ModeController < ApplicationController


  #食品の種類を新規登録
  def createmode
    @mode = Mode.new(create_mode_params)
    @mode.user_id = session[:user_id]
    @mode.save
    redirect_to("/mode/#{@mode.id}/editmode2")
  end

  def create_mode_params
    params.require(:mode).permit(
        :detail,
    )
  end

  #作成したモードと食品をつなぐ
  def createmode2
    @conect_mode = ConectFoodToMode.new(create_conect_mode_params)
    @conect_mode.user_id = session[:user_id]
    @conect_mode.mode_id = params[:mode_id]
    if @conect_mode.save
      flash[:notice] = "種類の登録に成功しました"
      redirect_to("/food/main")
    else
      flash[:notice_fail] = "種類の登録に失敗しました"
      redirect_to("/food/editmode")
    end
  end

  #食品と新規作成したモードを接続するページ
  def editmode2
    @conect_mode = ConectFoodToMode.new
    @foods = Food.where(user_id: session[:user_id])
    @current_food = []

    n = 1
    @foods.each do |food|
      @current_food << [n, n]
      n += 1
    end
  end

  def create_conect_mode_params
    params.require(:conect_food_to_mode).permit(
        :food_id
    )
  end

end
