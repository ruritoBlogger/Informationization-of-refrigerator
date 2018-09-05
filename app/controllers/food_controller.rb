class FoodController < ApplicationController

  #食品の新規登録ページ
  def new
  end

  #現在登録されている食品一覧ページ
  def index
    @foods = Food.where(user_id: session[:user_id])
  end

  def main
    @oldfoods = Food.where(user_id: session[:user_id],
                           limitMonth: 9,
                           limittype: true)

    @Fleshfoods = Food.where(user_id: session[:user_id],
                              limittype: false)
  end

  #食べ物の詳細ページ
  def show
    @food = Food.find_by(id: params[:id])
  end

  #食べ物の更新を行うページ
  def edit
    @food = Food.find_by(id: params[:id])
  end

  #食品の新規登録を行う
  def create
    @food = Food.new(user_id: session[:user_id],
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

  #食べ物の量の更新
  def update
    @food = Food.find_by(id: params[:id])
    @food.yetamount = @food.yetamount - params[:used].to_i
    @food.save
    flash[:notice] = "更新しました"
    redirect_to("/food/index")
  end

end
