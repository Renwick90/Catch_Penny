require( 'sinatra' )
require_relative('controllers/tags_controller')
require_relative('controllers/merchants_controller')
require_relative('controllers/transactions_controller')

get '/' do
  erb :home
end