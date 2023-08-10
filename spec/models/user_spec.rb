require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(email: 'test@blog.com', password: '123456', name: 'Jedda')
  end

  it 'should be valid' do
    expect(@user.valid?).to eq(true)
  end

  it 'should have a name' do
    expect(@user.name).to eq('Jedda')
  end

  it 'should have a password' do
    expect(@user.password).to eq('123456')
  end

  it 'should have a string as a name' do
    expect(@user.name).to be_a(String)
  end

  it 'should have a string as an email' do
    expect(@user.email).to be_a(String)
  end

  it 'should have an email' do
    expect(@user.email).to eq('test@blog.com')
  end
end
