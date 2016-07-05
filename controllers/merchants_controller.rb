require_relative('../models/merchant.rb')

get '/merchants' do
  @merchants = Merchant.all
  erb :'merchants/index'
end

# get '/merchants/new' do
#   erb :'merchants/new'
# end

# get '/pizza/:id' do
#   # find pizza with specific id
#   @merchant = Merchant.find(params[:id])
#   erb ( :show )
# end