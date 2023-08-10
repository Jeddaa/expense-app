class ItemsController < ApplicationController
  before_action :authenticate_user!

  def new
    @category = Category.find(params[:category_id])
    @item = @category.items.build
  end

  def create
    @category = Category.find(params[:category_id])
    @item = Item.new(item_params)
    @item.author_id = current_user.id

    puts 'not saved'

    if @item.save
      puts 'save category'
      ItemCategory.create(item: @item, category: @category)
      redirect_to category_path(@category), notice: 'Item was successfully added.'
    else
      puts @item.errors.full_messages
      flash.now[:alert] = 'Failed to create item.'
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:name, :amount)
  end
end
