class DrinksController < ApplicationController
  def index
    return @drinks = Drink.all.where(has_milk: true) if params['has_milk'] == 'true'
    return @drinks = Drink.all.where(has_milk: false) if params['has_milk'] == 'false'

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

  def destroy
    drink = Drink.find(params[:id])
    drink.destroy
    redirect_to '/drinks'
  end

  private

  def drink_params_for_update
    params.require(:drink).permit(:name, :calories, :has_milk)
  end
end
