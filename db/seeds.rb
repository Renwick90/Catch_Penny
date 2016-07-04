
require( 'pry-byebug' )
require_relative( '../models/tag' )
require_relative( '../models/merchant' )
require_relative( '../models/transaction' )


Tag.delete_all()
Merchant.delete_all()
Transaction.delete_all()

tag1 = Tag.new({'type' => 'Food'})
tag2 = Tag.new({'type' => 'Clothes'})
tag3 = Tag.new({'type' => 'Travel'})
tag4 = Tag.new({'type' => 'Entertainment'})
tag5 = Tag.new({'type' => 'Salary'})
t1 = tag1.save()
t2 = tag2.save()
t3 = tag3.save()
t4 = tag4.save()
t5 = tag5.save()


merchant1 = Merchant.new({'name' => 'Tesco'})
merchant2 = Merchant.new({'name' => 'TK Max'})
merchant3 = Merchant.new({'name' => 'Virgin'})
merchant4 = Merchant.new({'name' => 'Vue Cinema'})
merchant5 = Merchant.new({'name' => 'HALO'})
m1 = merchant1.save()
m2 = merchant2.save()
m3 = merchant3.save()
m4 = merchant4.save()
m5 = merchant5.save()

transaction1 = Transaction.new({'merchant_id' => m1.id, 'tag_id' => t1.id, 'amount' => '-30.50', 'trans_date' => '2016-06-01', 'trans_time' => '18:30', 'description' => 'general food shop', 'type' => 'debit'})
transaction2 = Transaction.new({'merchant_id' => m2.id, 'tag_id' => t2.id, 'amount' => '-25.00', 'trans_date' => '2016-05-05', 'trans_time' => '12:30', 'description' => 'black trousers', 'type' => 'debit'})
transaction3 = Transaction.new({'merchant_id' => m3.id, 'tag_id' => t3.id, 'amount' => '-45.50', 'trans_date' => '2016-02-11', 'trans_time' => '18:30', 'description' => 'train to London', 'type' => 'debit'})
transaction4 = Transaction.new({'merchant_id' => m4.id, 'tag_id' => t4.id, 'amount' => '-12.50', 'trans_date' => '2016-07-04', 'trans_time' => '19:30', 'description' => 'Independance Day 2 (shite)', 'type' => 'debit'})
transaction5 = Transaction.new({'merchant_id' => m5.id, 'tag_id' => t5.id, 'amount' => '3000', 'trans_date' => '2016-04-29', 'trans_time' => '12:00', 'description' => 'monthly pay', 'type' => 'credit'})
trans1 = transaction1.save()
trans2 = transaction2.save()
trans3 = transaction3.save()
trans4 = transaction4.save()
trans5 = transaction5.save()

binding.pry
nil
