class ItemsController < ApplicationController
  before_action :authenticate_user!

  def new
    @category = Category.find(params[:category_id])
    @item = @category.items.build
    @all_categories = Category.where(author_id: current_user.id)
  end

  def create
    @category = Category.find(params[:category_id])
    @item = Item.new(item_params)
    @item.author_id = current_user.id

    if @item.save
      redirect_to category_path(params[:category_id]), notice: 'Item was successfully added.'
    else
      @all_categories = Category.where(author_id: current_user.id)
      flash.now[:alert] = 'Failed to create item.'
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:name, :amount, category_ids: [])
  end
end
