class CategoriesController < ApplicationController
  def index
    @categories = Category.sort_by_newest
  end

  def show
    @category = Category.find(params[:id])
  end
end
