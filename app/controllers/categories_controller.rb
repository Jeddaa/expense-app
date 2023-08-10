class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    # @categories = Category.includes(:author).where(author_id: current_user.id)
    @categories = Category.where(author_id: current_user.id).includes([:items]).order('created_at DESC')

  end

  def show
    if current_user.id.to_i == Category.find(params[:id]).author_id.to_i
      @category = Category.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def new
    @category = Category.new
  end

  def create
    # @category = Category.new
    @category = Category.new(category_params)
    @category.author_id = current_user.id
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end

end
