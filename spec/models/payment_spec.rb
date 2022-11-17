require 'rails_helper'

RSpec.describe Payment, type: :model do
  before(:each) do
    @user = User.new(name: 'Shubh', email: 'test@gmail.com', password: 'password', password_confirmation: 'password')

    @user.save

    @group = Group.new(name: 'Group one', icon: 'Home')

    @group.save

    @payment = Payment.new(name: 'Payment one', amount: 1000)

    @payment.save

    @group.payments << @payment

    @user.groups << @group
  end

  it 'should have a name' do
    @payment.name
    expect(@payment.name).to eq('Payment one')
  end

  it 'should have an amount' do
    @payment.amount
    expect(@payment.amount).to eq(1000)
  end

  it 'should belong to a group' do
    @payment.groups
    expect(@payment.groups).to eq(@payment.groups)
  end
end
