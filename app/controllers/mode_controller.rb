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

  #食品の種類の一覧を表示するモード
  def editmode
    @mode = Mode.new
  end

end
