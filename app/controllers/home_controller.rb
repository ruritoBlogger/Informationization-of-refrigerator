class HomeController < ApplicationController

  def top
  end

  def new
    @user =User.new
  end

  def login
    @users = User.all
  end

end
