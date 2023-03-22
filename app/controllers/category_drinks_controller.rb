class CategoryDrinksController < ApplicationController
  def index
    @category = Category.find(params[:id])
    @drinks = @category.drinks
  end
end
