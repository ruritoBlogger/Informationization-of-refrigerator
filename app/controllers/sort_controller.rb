class SortController < ApplicationController

  def main
    @modes = Mode.where(user_id: session[:user_id])
    @foods = Food.where(user_id: session[:user_id]).order(:limitday)
  end

  def show
    @mode = params[:mode_id]
    @foods = Food.where(user_id: session[:user_id]).order(:limitday)
  end

end
