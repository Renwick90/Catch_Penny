require ('minitest/autorun')
require_relative('../models/tag')

class TestTag < Minitest::Test
  def setup
    @tag = Tag.new( "Food")
  end

  def test_name
  assert_equal("Food", @tag.type)
  end
end