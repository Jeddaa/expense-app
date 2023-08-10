class ItemsController < ApplicationController
  before_action :authenticate_user!

  # def create
  #   @category = Category.find(params[:category_id])
  #   @item = @category.items.build(item_params)

  #   if @item.save
  #     redirect_to category_path(@category), notice: "Item was successfully added."
  #   else
  #     render :new
  #   end
  # end
  # def index
  #   @items = Item.includes(:author).where(author_id: current_user.id)
  # end

  # def show
  # end

  # def new
  #   @item = Item.new
  # end

  def new
    @category = Category.find(params[:category_id])
    @item = @category.items.build
  end

  def create
    @category = Category.find(params[:category_id])
    @item = Item.new(item_params)
    @item.author_id = current_user.id

    puts "not saved"

    if @item.save
      puts "save category"
      ItemCategory.create(item: @item, category: @category)
      redirect_to category_path(@category), notice: "Item was successfully added."
    else
      puts @item.errors.full_messages
      flash.now[:alert] = "Failed to create item."
      render :new
    end
  end

  # def create
  #   # @user = current_use
  #   @item = Item.new(item_params)
  #   @item.author_id = current_user.id
  #   # @item.author_id_id = current_user.id
  #   if @item.save
  #     redirect_to items_path, notice: 'Expense was successfully added.'
  #   else
  #     render :new
  #   end
  # end

  def item_params
    params.require(:item).permit(:name, :amount)
  end

end
