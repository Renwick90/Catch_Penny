require ('minitest/autorun')
require_relative('../models/account')
require_relative('../models/transaction')
require_relative('../models/tag')
require_relative('../models/merchant')

class TestAccount < Minitest::Test
  def setup
    tag1 = Tag.new({'type' => 'Food', 'id'=> 1})
    tag2 = Tag.new({'type' => 'Clothes', 'id' => 2})
    tag3 = Tag.new({'type' => 'Travel', 'id' => 3})
    tag5 = Tag.new({'type' => 'Salary','id' => 4})

 

    merchant1 = Merchant.new({'name' => 'Tesco'})
    merchant2 = Merchant.new({'name' => 'TK Max'})
    merchant3 = Merchant.new({'name' => 'Virgin'})
    merchant5 = Merchant.new({'name' => 'HALO'})



    transaction1 = Transaction.new({'merchant_id' => merchant1.id, 'tag_id' => tag1.id, 'amount' => '-30.50', 'trans_date' => '2016-06-01', 'trans_time' => '18:30', 'description' => 'general food shop', 'type' => 'debit'})
    transaction2 = Transaction.new({'merchant_id' => merchant2.id, 'tag_id' => tag2.id, 'amount' => '-25.00', 'trans_date' => '2016-05-05', 'trans_time' => '12:30', 'description' => 'black trousers', 'type' => 'debit'})
    transaction3 = Transaction.new({'merchant_id' => merchant3.id, 'tag_id' => tag3.id, 'amount' => '-45.50', 'trans_date' => '2016-02-11', 'trans_time' => '18:30', 'description' => 'train to London', 'type' => 'debit'})

    transaction5 = Transaction.new({'merchant_id' => merchant5.id, 'tag_id' => tag5.id, 'amount' => '3000', 'trans_date' => '2016-04-29', 'trans_time' => '12:00', 'description' => 'monthly pay', 'type' => 'credit'})

    @transactions = [transaction1, transaction2, transaction3, transaction5]

    @account = Account.new(@transactions)
  end

  def test_total_transactions_amount
    assert_equal(2899, @account.total_transactions_amount )
  end

  def test_transactions_credit
    assert_equal(3000, @account.transactions_credit)
  end

def test_total_by_tag
  @tag_id = @tag1
  assert_equal(-30.50, @account.total_by_tag_id(1))
  
end

end