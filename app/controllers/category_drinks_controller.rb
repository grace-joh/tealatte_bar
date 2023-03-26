class CategoryDrinksController < ApplicationController
  def index
    @category = Category.find(params[:id])
    @drinks = @category.sorted_and_filtered_drinks(params[:cal_max], params['sort'])
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
