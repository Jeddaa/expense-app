class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.includes(:author).where(author_id: current_user.id)
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    # @user = current_use
    @item = Item.new(item_params)
    @item.author_id = current_user.id
    # @item.author_id_id = current_user.id
    if @item.save
      redirect_to items_path, notice: 'Expense was successfully added.'
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:name, :amount)
  end

end
