require 'pry-byebug'
require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require_relative('../models/merchant.rb')
require_relative('../models/account.rb')

get '/account' do
  query = params[:search]
  query_type = params[:search_type]
@transactions = Transaction.all(query, query_type)
@tags = Tag.all()
@merchants = Merchant.all()
@account = Account.new(@transactions)
erb(:account )
end


