class CategoryDrinksController < ApplicationController
  def index
    @category = Category.find(params[:id])

    return @drinks = @category.drinks.all.order(:name) if params['sort'] == 'abc'
    return @drinks = @category.drinks.all.order(:calories) if params['sort'] == 'cal'

    @drinks = @category.drinks
  end

  def new
  end

  def create
    @category = Category.find(params[:id])
    @category.drinks.create(drink_params_for_create)
    redirect_to "/categories/#{@category.id}/drinks"
  end

  private

  def drink_params_for_create
    params.permit(:name, :calories, :has_milk)
  end
end
