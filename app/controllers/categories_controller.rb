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
    Category.create(category_params_for_create)
    redirect_to '/categories'
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    category.update(category_params_for_update)
    redirect_to "/categories/#{category.id}"
  end

  private

  def category_params_for_create
    params.permit(:name, :price, :caffeinated)
  end

  def category_params_for_update
    params.require(:category).permit(:name, :price, :caffeinated)
  end
end
