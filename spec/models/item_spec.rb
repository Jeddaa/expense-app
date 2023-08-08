require 'rails_helper'

RSpec.describe Item, type: :model do

  before(:each) do
    @user = User.create(email:'test@blog.com', password: '123456', name: 'Jedda')
    @item = Item.create(name: 'test', amount: 1000, author: @user)
  end

  it 'should be valid' do
    expect(@item).to be_valid
  end

  it 'should have a valid amount' do
    expect(@item.amount).to be_an(Integer)
  end

  it 'should have a valid author' do
    expect(@item.author).to be_an(User)
  end

  it 'should have a valid name' do
    expect(@item.name).to be_a(String)
  end
end
