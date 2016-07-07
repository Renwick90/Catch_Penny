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

 def total_balance
  balance = 0

  for transaction in @transactions

    if transaction.type == 'credit'
      balance += transaction.amount
    elsif transaction.type == 'debit'
      balance -= transaction.amount
    end 
  end
  return balance
end

def transactions_credit()
  credits = 0 
  @transactions.each do |transaction|
    credits += transaction.amount if transaction.type.downcase == "credit"
  end
  return credits
end

def transactions_debit()
  debits = 0 
  @transactions.each do |transaction|
    debits += transaction.amount if transaction.type.downcase == "debit"
  end
  return debits
end

def total_by_tag_id(tag_id)
  total = 0
  @transactions.each do |transaction|
    total += transaction.amount if transaction.tag_id == tag_id
  end
  return total
end

# def percentage_saving 
#   balance = transactions.total_balance
#   credits = transactions.transactions_credit

#   (credits/100 )*
  

# end 

end