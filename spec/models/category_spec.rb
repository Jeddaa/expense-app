require 'rails_helper'

RSpec.describe Category, type: :model do

  before(:each) do
    @user = User.create(email:'test@blog.com', password: '123456', name: 'Jedda')
    @category = Category.create(name: 'category', icon: 'fa fa', author: @user)
  end

  it 'should create a category' do
    expect(@category).to be_valid
  end

  it 'should have a string as icon' do
    expect(@category.icon).to be_a(String)
  end

  it 'should have a string as name' do
    expect(@category.name).to be_a(String)
  end

  it 'should have a valid author id' do
    expect(@category.author_id).to be_an(Integer)
  end
end
