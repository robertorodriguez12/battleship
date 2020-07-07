require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/ship'
require './lib/cell'
require 'pry'

class CellTest < MiniTest::Test
  def test_cell_exists
    cell = Cell.new("B4")

    assert_instance_of Cell, cell

  end


end
