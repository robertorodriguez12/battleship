require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/board'
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
    expected = [ 'A1', 'A2', 'A3', 'A4', 'B1', 'B2', 'B3', 'B4', 'C1', 'C2', 'C3', 'C4', 'D1', 'D2', 'D3', 'D4']
    assert_equal expected, board.cells.keys
  end

  def test_board_has_valid_coordinates
    board = Board.new
     assert_equal true, board.valid_coordinate?("A1")
     assert_equal false, board.valid_coordinate?("A5")
     assert_equal false, board.valid_coordinate?("E1")
     assert_equal false, board.valid_coordinate?("A22")
  end

  def test_board_can_validate_placements
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
  end

end
