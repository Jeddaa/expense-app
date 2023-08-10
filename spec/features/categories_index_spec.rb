require 'rails_helper'

RSpec.describe 'Category', type: :feature do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(email: 'test@blog.com', password: '123456', name: 'Jedda')
    sign_in @user
    @category1 = Category.create(name: 'House', icon: 'fa fa-house', author: @user)
    @category2 = Category.create(name: 'Work', icon: 'fa fa', author: @user)
  end

  describe 'categorys#index' do
    before(:each) do
      visit categories_path
    end

    it 'should show the category name of category1' do
      expect(page).to have_content(@category1.name)
    end

    it 'should show the category name of category2' do
      expect(page).to have_content(@category2.name)
    end

    it 'should show the heading TRANSACTIONS' do
      expect(page).to have_content('TRANSACTIONS')
    end
  end
end
