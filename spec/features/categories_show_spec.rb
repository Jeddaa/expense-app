require 'rails_helper'

RSpec.describe 'Category', type: :feature do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(email: 'test@blog.com', password: '123456', name: 'Jedda')
    sign_in @user
    @category = Category.create(name: 'House', icon: 'fa fa', author: @user)
    @item1 = Item.create(name: 'Light bill', amount: 10, author: @user)
    @item2 = Item.create(name: 'Phone bill', amount: 20, author: @user)
    @item_category1 = ItemCategory.create(item: @item1, category: @category)
    @item_category2 = ItemCategory.create(item: @item2, category: @category)
  end

  describe 'recipes#index' do
    before(:each) do
      visit category_path(@category)
    end

    it 'should show the recipe name of recipe1' do
      expect(page).to have_content(@category.name)
    end

    it 'should show the recipe name of recipe1' do
      expect(page).to have_content(@item1.name)
    end

    it 'should show the recipe name of recipe1' do
      expect(page).to have_content(@item2.amount)
    end

    it 'should show the recipe name of recipe1' do
      expect(page).to have_content(@item1.name)
    end

    it 'should show the recipe name of recipe1' do
      expect(page).to have_content(@item2.amount)
    end

    it 'should show the total amount for item1 and item2 ' do
      expect(page).to have_content('30')
    end
  end
end
