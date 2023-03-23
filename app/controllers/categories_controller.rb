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

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    category.update(category_params)
    redirect_to "/categories/#{category.id}"
  end

  private

  def category_params
    params.require(:category).permit(:name, :price, :caffeinated)
  end
end
