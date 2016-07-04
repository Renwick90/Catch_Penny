require 'pry-byebug'
require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require_relative('../models/merchant.rb')

get '/transactions' do
  @transactions = Transaction.all()
  erb :'transaction/index'
end

get '/transactions/new' do
  @books = Tag.all()
  @members = Merchant.all()
  erb :'transactions/new'
end

post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save
  redirect to( "transactions" )
end