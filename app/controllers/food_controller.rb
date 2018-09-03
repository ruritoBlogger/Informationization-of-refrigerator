class FoodController < ApplicationController
  def new
    @foods = Food1.all
  end
end
