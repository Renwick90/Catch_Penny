require('pg')
require_relative('../db/sql_runner')
require_relative('tag')
require_relative('merchant')

class Rental

  attr_reader(:id, :merchant_id, :tag_id, :amount, :date, :description, :type)

  def initialize( options )
    @id = options['id'].to_i
    @merchant_id = options['book_id'].to_i
    @tag_id = options['member_id'].to_i
    @amount = options['amount'].to_i
    @date = options['date']
    @type = options['type']
  end

end