require('pg')
require_relative('../db/sql_runner')

class Tag

  attr_reader :id, :type

  def initialize( options )
    @id = options['id'].to_i
    @type = options['type']
  end

  def save()
    sql = "INSERT INTO tags (type) VALUES ('#{@type}') RETURNING *"
      tag = run(sql).first
      result = Tag.new( tag )
      return result
  end

  def self.all()
    sql = "SELECT * FROM tags"
    return Tag.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    run(sql)
  end

  def self.map_items(sql)
    tag = run(sql)
    result = tag.map {|product| Tag.new(product)}
    return result
  end

  def self.map_item(sql)
    result = Tag.map_items(sql)
    return result.first
  end
end