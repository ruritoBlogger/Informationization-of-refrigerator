class FoodController < ApplicationController

  #食品の新規登録ページ
  def new
  end

  #現在登録されている食品一覧ページ
  def index
    @foods = Food1.all
  end

  #食品の新規登録を行う
  def create
    @food = Food1.new(user_id: session[:user_id],
                      limittype: params[:limittype],
                      limitYear: params[:limitYear],
                      limitMonth: params[:limitMonth],
                      limitDay: params[:limitDay],
                      foodtype: params[:foodtype],
                      amount: params[:amount],
                      name: params[:name])
    @food.save
    flash[:notice] = "食べ物の新規登録を行いました"
    redirect_to("/food/new")
  end
end
