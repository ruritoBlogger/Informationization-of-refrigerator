class HomeController < ApplicationController

  def top
  end

  def new
  end

  def login
    @users = User.all
  end

end
