class MainController < ApplicationController

  def profile
    @user = User.find_by(id: session[:user_id])
  end

  def edit

  end

end
