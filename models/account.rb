require( 'pg' )
require( 'pry-byebug' )
require_relative('../db/sql_runner')
require_relative('tag.rb')
require_relative('merchant.rb')
require_relative('transaction.rb')

class Account

  attr_reader(:transactions)

  def initialize( transactions )
    @transactions = transactions
  end

 def total_transactions_amount
   @transactions.reduce(0) { |sum, transaction| sum + transaction.amount }
 end

  def account_credit()
    credits = 0 
    @transactions.each do |transaction|
      credits += transaction.amount if transaction.type.downcase == "credit"
    end
    return credits
  end

  def account_debit()
    debits = 0 
    @accounts.each do |account|
      debits += account.amount if account.transaction_type.downcase == "debit"
    end
    return debits
  end
end