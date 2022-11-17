require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.new(name: 'Shubh', email: 'test@gmail.com', password: 'password', password_confirmation: 'password')

    @user.save

    @group = Group.new(name: 'Group one', icon: 'Home')

    @group.save

    @payment = Payment.new(name: 'Payment one', amount: 1000)

    @payment.save

    @group.payments << @payment
  end

  it 'should have a name' do
    @group.name
    expect(@group.name).to eq('Group one')
  end

  it 'should have an icon' do
    @group.icon
    expect(@group.icon).to eq('Home')
  end

  it 'should have payments' do
    @group.payments
    expect(@group.payments).to eq([@payment])
  end
end