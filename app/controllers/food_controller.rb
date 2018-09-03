class FoodController < ApplicationController

  #食品の新規登録ページ
  def new
  end

  #現在登録されている食品一覧ページ
  def index
    @foods = Food1.all
  end

  def main
    @oldfoods = Food1.where(limitMonth: 9,
                        limittype: true)

    @Fleshfoods = Food1.where(limittype: false)
  end

  #食品の新規登録を行う
  def create
    @food = Food1.new(user_id: session[:user_id],
                      limitYear: params[:limitYear],
                      limitMonth: params[:limitMonth],
                      limitDay: params[:limitDay],
                      amount: params[:amount],
                      name: params[:name])

    if params[:limittype1]
      @food.limittype = true
    else
      @food.limittype = false
    end

    if params[:foodtype1]
      @food.foodtype = true
    else
      @food.foodtype = false
    end

    @food.save
    flash[:notice] = "食べ物の新規登録を行いました"
    redirect_to("/food/index")
  end

end
