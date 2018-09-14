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
    logger.debug("//////////////////////////////////////////////////")
    logger.debug("food_id:#{params[:conect_food_to_mode][:food_id]}")
    params[:food_id].each do |id|
      @conect_mode = ConectFoodToMode.new
      @conect_mode.user_id = session[:user_id]
      @conect_mode.mode_id = params[:mode_id]
      @conect_mode.food_id = id[:state]
      @conect_mode.save
    end
    redirect_to("/food/main")
  end

  #種類を登録するページ
  def editmode
    @mode = Mode.new
  end

  #食品と新規作成したモードを接続するページ
  def editmode2
    @conect_mode = ConectFoodToMode.new
    @foods = Food.where(user_id: session[:user_id])

    #生成したモードを今現在存在する食品に紐付ける
    # 食品に紐付けるためのセレクトボックスを動的に生成する
  end

  def create_conect_mode_params
    params.require(:conect_food_to_mode).permit(
        :food_id
    )
  end

end
