require_relative('../models/merchant.rb')

get '/merchant' do
  @merchant = Merchant.all
  erb :'merchant/index'
end

get '/merchant/new' do
  erb :'merchant/new'
end