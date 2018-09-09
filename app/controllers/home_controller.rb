class HomeController < ApplicationController

  def top
  end

  def new
    @user =User.new
  end

  def login
    @user = User.new

    #デバッグ
    @users = User.all
  end

end
