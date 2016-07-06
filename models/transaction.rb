require('pg')
require_relative('../db/sql_runner')
require_relative('tag')
require_relative('merchant')

class Transaction

  attr_reader(:id, :merchant_id, :tag_id, :amount, :trans_date, :trans_time, :description, :type)

  def initialize( options )
    @id = options['id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @amount = options['amount'].to_f
    @trans_date = options['trans_date']
    @trans_time = options['trans_time']
    @description = options['description']
    @type = options['type']
  end

  def save()
    sql = "INSERT INTO transactions (merchant_id, tag_id, amount, trans_date, trans_time, description, type) VALUES ('#{@merchant_id}', '#{@tag_id}', '#{@amount}', '#{@trans_date}', '#{@trans_time}', '#{@description}', '#{@type}') RETURNING *"
      transaction = run(sql).first
      result = Transaction.new( transaction )
      return result
  end



  def self.all(query = "", query_type = "")
    query = query.to_s
    query_type = query_type.to_s
    sql = "SELECT * FROM transactions"
    sql = sql + " WHERE tag_id = #{query}" if query != "" && query_type == "tag"
    sql = sql + " WHERE merchant_id = #{query}" if query != "" && query_type == "merchant"
    return Transaction.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    run(sql)
  end

  def self.map_items(sql)
    transaction = run(sql)
    result = transaction.map {|product| Transaction.new(product)}
    return result
  end

  def merchant_name()
      sql = "SELECT name FROM merchants WHERE id = #{@merchant_id}"
      return Merchant.map_item(sql).name
    end

    def tag_name()
       sql = "SELECT type FROM tags WHERE id = #{@tag_id}"
       return Tag.map_item(sql).type
     end

  def self.map_item(sql)
    result = Transaction.map_items(sql)
    return result.first
  end
end