
require( 'pry-byebug' )
require_relative( '../models/tag' )
require_relative( '../models/merchant' )


Tag.delete_all()
Merchant.delete_all()

tag1 = Tag.new({'type' => 'Food'})
t1 = tag1.save()


merchant1 = Merchant.new({'name' => 'Tesco'})
m1 = merchant1.save()


binding.pry
nil
