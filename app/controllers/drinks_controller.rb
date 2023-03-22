class DrinksController < ApplicationController
  def index
    @drinks = Drink.all
  end

  def show
    @drink = Drink.find(params[:id])
  end
end
