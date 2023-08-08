require 'rails_helper'

RSpec.describe ItemCategory, type: :model do
 before(:each) do
    @user = User.create(email:'test@blog.com', password: '123456', name: 'Jedda')
    @item = Item.create(name: 'test', amount: 1000, author: @user)
    @category = Category.create(name: 'category', icon: 'fa fa', author: @user)
    @item_category = ItemCategory.create(item: @item, category: @category)
  end

  it 'should have a valid item' do
    expect(@item_category.item).to be_an(Item)
  end

  it 'should have a valid item_id' do
    expect(@item_category.item_id).to be_an(Integer)
  end

  it 'should have a valid category' do
    expect(@item_category.category).to be_a(Category)
  end

  it 'should have a valid category_id' do
    expect(@item_category.category_id).to be_an(Integer)
  end
end
