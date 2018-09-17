class FoodController < ApplicationController

  #アクセス制限
  before_action :checkLogin
  before_action :checkUser, only: [:show, :edit, :editinfo, :update, :destroy, :updateinfo]

  #食品の新規登録ページ
  def new
    @modes = Mode.where(user_id: session[:user_id])
    @food = Food.new
  end

  #現在登録されている食品一覧ページ
  def index
    @foods = Food.where(user_id: session[:user_id]).order(:limitday)
    @food = Food.new

  end

  #メインページ
  def main
    @oldfoods = Food.where(user_id: session[:user_id],
                           limittype: "賞味期限",
                           limitday: @today..@today + 30).order(:limitday)

    @Fleshfoods = Food.where(user_id: session[:user_id],
                             limittype: "消費期限").order(:limitday)

    @modes = Mode.where(user_id: session[:user_id])

  end

  #食べ物の詳細ページ
  def show
    @food = Food.find_by(id: params[:id])
    conect_food_to_mode = ConectFoodToMode.find_by(user_id: session[:user_id],
                                                   food_id: @food.id)
    @mode = Mode.find_by(id: conect_food_to_mode.mode_id)
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
    @mode = Mode.new
  end

  def create_params
    params.require(:food).permit(
        :user_id,
        :limittype,
        :foodtype,
        :name,
        :amount,
        :yetamount,
        :amounttype,
    )
  end

  #選択された食品の情報を更新するページ
  def editinfo
    @food = Food.new
    @modes = Mode.where(user_id: session[:user_id])
  end

  #食品の新規登録を行う
  def create
    @food = Food.new(create_params)
    @food.yetamount = 100
    @food.user_id = session[:user_id]
    @food.image_name = "https://uds.gnst.jp/rest/img/1ew287ve0000/s_006z.jpg?t=1506082927"

    @food.limitday = Time.zone.local(params[:food]["limitday(1i)"].to_i, params[:food]["limitday(2i)"].to_i, params[:food]["limitday(3i)"].to_i)
    if !(@food.save)
      @food.errors.full_messages.each do |f|
      end

      flash[:notice_fail] = "登録に失敗しました"
      redirect_to("/food/new")
    else

      #食べ物の画像の保存
      if params[:food][:image_name]
        @food.image_name = "#{@food.id}.jpg"
        image = params[:food][:image_name]
        File.binwrite("public/food#{session[:user_id]}_images/#{@food.image_name}", image.read)
      else
        #ネットからのurlで画像を用意する
        @food.image_name = "https://uds.gnst.jp/rest/img/1ew287ve0000/s_006z.jpg?t=1506082927"
      end
      @food.save
      food = Food.find_by(id: @food.id)
      food.save
      session[:food_id] = food.id
      redirect_to("/mode/conect")
    end
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

  #登録された食べ物の情報の変更（残り量以外）
  def updateinfo
    food = Food.find_by(create_params)

    #食品の画像について
    if params[:food][:image_name]
      food.image_name = "#{food.id}.jpg"
      image = params[:food][:image_name]
      File.binwrite("public/food#{session[:user_id]}_images/#{food.image_name}", image.read)
    else
      #ネットからのurlで画像を用意する
      food.image_name = "https://uds.gnst.jp/rest/img/1ew287ve0000/s_006z.jpg?t=1506082927"
    end

    #保存できるかの処理
    if food.save
      flash[:notice] = "更新しました"
      redirect_to("/food/index")
    else
      flash[:notice_fail] = "更新に失敗しました"
      redirect_to("/food/#{food.id}/editinfo")
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
