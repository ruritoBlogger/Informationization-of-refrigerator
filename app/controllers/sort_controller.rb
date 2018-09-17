class SortController < ApplicationController

  def main
    @modes = Mode.where(user_id: session[:user_id])
    @foods = Food.where(user_id: session[:user_id]).order(:limitday)
  end

  def show
    @mode = Mode.find_by(id: params[:mode_id])
    logger.debug("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^~~~#{@mode}")
    logger.debug("#{@mode.id}")


  end
end
