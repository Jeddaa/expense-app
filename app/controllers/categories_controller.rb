class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.includes(:author).where(author_id: current_user.id)
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new

    if params[:icon].blank?
      @category.icon = params[:custom_icon_link]
    # else
    #   @category.icon = params[:icon]
    end
    @category = Category.new(category_params)

    @category.author_id = current_user.id
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def category_params
    params.require(:category).permit(:name, :icon, :custom_icon_link)
  end

end
