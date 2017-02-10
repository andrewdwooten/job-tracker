class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.title} added!"
      redirect_to category_path(@category)
    else
      redirect_to new_category_path
    end
  end

  def show
    @category = Category.find(params[:id])
    render :show
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
