require 'rails_helper'

RSpec.describe 'Payments', type: :request do
  before(:each) do
    @user = User.new(name: 'Shubh', email: 'example.gmail.com', password: 'password',
                     password_confirmation: 'password')
    @user.save
    @group = Group.new(name: 'Group one', icon: 'Home')
    @group.save
    @payment = Payment.new(name: 'Payment one', amount: 1000)
    @payment.save
    @group.payments << @payment
    @user.groups << @group
  end

  it 'should return a 302 status code' do
    get payments_path
    expect(response).to have_http_status(302)
  end
end