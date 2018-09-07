class FoodController < ApplicationController

  #食品の新規登録ページ
  def new
    @modes = Mode.where(user_id: session[:user_id])
  end

  #現在登録されている食品一覧ページ
  def index
    @foods = Food.where(user_id: session[:user_id])
  end

  #メインページ
  def main
    @oldfoods = Food.where(user_id: session[:user_id],
                           limittype: true)

    @Fleshfoods = Food.where(user_id: session[:user_id],
                              limittype: false)

    @modes = Mode.where(user_id: session[:user_id])
  end

  #食べ物の詳細ページ
  def show
    @food = Food.find_by(id: params[:id])
  end

  #食べ物の更新を行うページ
  def edit
    @food = Food.find_by(id: params[:id])
  end

  #食品の種類を編集するページ
  def makemode
    @modes = Mode.where(user_id: session[:user_id])
  end

  #食品の種類を新規に登録するページ
  def editmode
    @foods = Food.where(user_id: session[:user_id])
  end

  #食品の新規登録を行う
  def create
    @food = Food.new(user_id: session[:user_id],
                     limitYear: params[:limitYear],
                     limitMonth: params[:limitMonth],
                     limitDay: params[:limitDay],
                     amount: params[:amount],
                     name: params[:name],
                     yetamount: 100)
    @food.save
    @food = Food.find_by(user_id: session[:user_id],
                        limitYear: params[:limitYear],
                        limitMonth: params[:limitMonth],
                        limitDay: params[:limitDay],
                        amount: params[:amount],
                        name: params[:name],
                        yetamount: 100)

    #受け取ったモードを保存する
    #@modes = Mode.where(user_id: session[:user_id])
    #@modes.each do |mode|
    #  if params[:addmode]
    #
    #  end
    #end

    #食べ物の画像の保存
    if params[:image_name]
      @food.image_name = "#{@food.id}.jpg"
      image = params[:image_name]
      File.binwrite("public/food#{session[:user_id]}_images/#{@food.image_name}",image.read)
    else
      #ネットからのurlで画像を用意する
      @food.image_name = "https://uds.gnst.jp/rest/img/1ew287ve0000/s_006z.jpg?t=1506082927"
    end

    #  @limitYear = params[:limitYear]
    #  @limitMonth = params[:limitMonth]
    #  @limitDay = params[:limitDay]
    #  @amount = params[:amount]
    #  @name = params[:name]

    #賞味期限か消費期限かの判断
    if params[:limit]
      @food.limittype = true
    else
      @food.limittype = false
    end

    #加工食品か生鮮食品かの判断
    if params[:foodtype]
      @food.foodtype = true
    else
      @food.foodtype = false
    end

    #個数の単位の判断
    if params[:amounttype] == 0
      @food.amounttype = "g"
    elsif params[:amounttype] == 1
      @food.amounttype = "mL"
    elsif params[:amounttype] == 2
      @food.amounttype = "人前"
    else
      @food.amounttype = "個・本"
    end

    @food.save
    flash[:notice] = "食べ物の新規登録を行いました"
    redirect_to("/food/index")
  end

  #食べ物の量の更新
  def update
    @user = User.find_by(id: session[:user_id])
    @food = Food.find_by(id: params[:id])
    @food.yetamount = @food.yetamount - params[:used].to_i
    if @food.yetamount <= 0
      @food.destroy
      flash[:notice] = "食べ物を使いきりました！"
      leveling()
      redirect_to("/food/index")
    else
      @food.save
      flash[:notice] = "更新しました"
      redirect_to("/food/index")
    end
  end

  #食べ物の情報を削除
  def destroy
    @food = Food.find_by(id: params[:id])
    @food.destroy
    flash[:notice] = "食べ物の情報を削除しました"
    redirect_to("/food/index")
  end

end
