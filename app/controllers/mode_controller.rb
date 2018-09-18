class ModeController < ApplicationController


  #食品の種類を新規登録
  def createmode
    @mode = Mode.new(create_mode_params)
    @mode.user_id = session[:user_id]
    @mode.save
    session[:mode_id] = @mode.id
    flash[:notice] = "新しい食品の種類を登録しました"
    redirect_to("/mode/editmode2")
  end

  def create_mode_params
    params.require(:mode).permit(
        :detail,
    )
  end

  #新規登録した食品を種類と関連付ける
  def conectmode
    logger.debug("---------------------------------#{params[:mode_id]}")
    modes = params[:mode_id]
    modes.each do |m|
      if m == nil || m == "" || m == "0" || m == 0
      else
        logger.debug("#{m}")
        mode = Mode.find_by(id: m.to_i)
        logger.debug("mode:#{mode.detail}")
        @conect_food_to_mode = ConectFoodToMode.new
        @conect_food_to_mode.food_id = session[:food_id]
        @conect_food_to_mode.user_id = session[:user_id]
        @conect_food_to_mode.mode_id = mode.id
        @conect_food_to_mode.save
      end
    end
    session[:food_id] = nil
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

  #新規登録した種類と食品を関連付けるページ
  def editmode2
    @mode = session[:mode_id]
    @foods = Food.where(user_id: session[:user_id])
    @conect_food_to_mode = ConectFoodToMode.new
  end

  #新規登録した種類と食品を関連付ける
  def createmode2
    foods = params[:food_id]
    if foods
      foods.each do |f|
        if f == nil || f == ""
        else
          food = Food.find_by(id: f.to_i)
          logger.debug("-------------------------------------------")
          logger.debug("data:#{f}")
          logger.debug("food:#{food}")
          logger.debug("params:#{params}")
          @conect_food_to_mode = ConectFoodToMode.new(user_id: session[:user_id],
                                                      mode_id: session[:mode_id],
                                                      food_id: food.id)
          @conect_food_to_mode.save
        end
      end
    end
    flash[:notice] = "登録しました"
    redirect_to("/food/main")
  end

  #種類の削除
  def destroy
    @mode = Mode.find_by(id: params[:mode_id])
    @mode.destroy
    flash[:notice] = "削除しました"
    redirect_to("/food/makemode")
  end

end
