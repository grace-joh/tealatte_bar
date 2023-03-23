class CategoriesController < ApplicationController
  def index
    @categories = Category.sort_by_newest
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
  end

  def create
    Category.create(category_params)
    redirect_to '/categories'
  end

  private

  def category_params
    params.permit(:name, :price, :caffeinated)
  end
end
