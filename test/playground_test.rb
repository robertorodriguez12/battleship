require 'minitest/autorun'
require 'minitest/pride'
require './lib/playground'
require './lib/cell'
require './lib/ship'
require 'pry'

class BoardTest < Minitest::Test

  def test_board_exists
    board = Board.new

    assert_instance_of Board, board
  end

  def test_board_has_cells
    board = Board.new

    assert_equal @cells, board.cells
  end
end
