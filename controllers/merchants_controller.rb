require_relative('../models/merchant.rb')

get '/merchants' do
  @merchants = Merchant.all
  erb :'merchants/index'
end

get '/merchants/new' do
  erb :'merchants/new'
end

post '/merchants' do
 
  @merchant = Merchant.new(params)
  @merchant.save
  redirect to :'merchants' 
end

