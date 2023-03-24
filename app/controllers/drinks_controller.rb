class DrinksController < ApplicationController
  def index
    @drinks = Drink.all
  end

  def show
    @drink = Drink.find(params[:id])
  end

  def edit
    @drink = Drink.find(params[:id])
  end

  def update
    drink = Drink.find(params[:id])
    Drink.update(drink_params_for_update)
    redirect_to "/drinks/#{drink.id}"
  end

  private

  def drink_params_for_update
    params.require(:drink).permit(:name, :calories, :has_milk)
  end
end
