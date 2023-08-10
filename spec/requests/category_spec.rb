require 'rails_helper'

RSpec.describe 'Category', type: :request do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(email: 'test@blog.com', password: '123456', name: 'Jedda')
    sign_in @user
    @category = Category.create(name: 'House', icon: 'fa fa', author: @user)
    @item = Item.create(name: 'Light bill', amount: 10, author: @user)
    @item_category = ItemCategory.create(item: @item, category: @category)
  end

  describe 'GET' do
    it 'returns http success for categories#index' do
      get authenticated_root_path
      expect(response).to have_http_status(:success)
    end

    it 'render correct categories#index' do
      get categories_path
      expect(response).to render_template(:index)
    end

    it 'render correct categories#show' do
      get category_path(@category)
      expect(response).to render_template(:show)
    end

    it 'renders the correct placeholder for categories#new' do
      get new_category_path
      expect(response.body).to include('Select an Icon')
    end

    it 'renders the correct placeholder for categories#index' do
     get categories_path
      expect(response.body).to include('House')
    end

    it 'renders the correct placeholder for categories#show' do
     get category_path(@category)
      expect(response.body).to include('TOTAL PAYMENT')
    end

    it 'renders the correct item name for categories#show' do
     get category_path(@category)
      expect(response.body).to include(@item.name)
    end

    it 'renders the correct item amount for categories#show' do
     get category_path(@category)
      expect(response.body).to include('10')
    end
  end

  describe 'POST' do
    before(:each) do
      category_param = { name: 'Dinner date', icon: 'www.google.com', author: @user }
      post categories_path, params: { category: category_param }
    end

    it 'creates a new category' do
      expect(response.status).to eq(302)
    end

    it 'category name should be Dinner date' do
      expect(Category.last.name).to eq('Dinner date')
    end

    it 'category count should be 2' do
      expect(Category.count).to eq(2)
    end

    it 'last Category description should be same as Category_params' do
      expect(Category.last.icon).to be_a(String)
    end
  end
end

