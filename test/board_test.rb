require 'minitest/autorun'
require 'minitest/pride'
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

  def test_coordinates_are_consecutive
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])
    assert_equal false, board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    assert_equal false, board.valid_placement?(submarine, ["C1", "B1"])
  end

  def test_coordinates_are_not_diagonal
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ['A1', 'B2', 'C3'])
  end

  def test_ships_cannot_overlap
   board = Board.new
   cruiser = Ship.new("Cruiser", 3)

   board.place(cruiser, ["A1", "A2", "A3"])

   submarine = Ship.new("Submarine", 2)

   board.valid_placement?(submarine, ["A1", "B1"])

   assert_equal false, board.valid_placement?(submarine, ['A1', 'B1'])
  end

  def test_coordinates_are_consecutive
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])
    assert_equal false, board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    assert_equal false, board.valid_placement?(submarine, ["C1", "B1"])
    
    assert_equal true, board.valid_placement?(cruiser, ["A1", "A2", "A3"])
    assert_equal true, board.valid_placement?(cruiser, ["B4", "C4", "D4"])
    assert_equal true, board.valid_placement?(submarine, ["D2", "D3"])
  end

  def test_coordinates_are_not_diagonal
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ['A1', 'B2', 'C3'])
  end

  def test_ships_cannot_overlap
   board = Board.new
   cruiser = Ship.new("Cruiser", 3)

   board.place(cruiser, ["A1", "A2", "A3"])

   submarine = Ship.new("Submarine", 2)

   board.valid_placement?(submarine, ["A1", "B1"])

   assert_equal false, board.valid_placement?(submarine, ['A1', 'B1'])
    assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "C3"])
    assert_equal false, board.valid_placement?(submarine, ["C2", "D3"])
  end

  # def test_can_place_ship
  #   board = Board.new
  #   cruiser = Ship.new("Cruiser", 3)
  #   # @cells.keys = ['A1', 'A2', 'A3', 'A4', 'B1', 'B2', 'B3', 'B4', 'C1', 'C2', 'C3', 'C4', 'D1', 'D2', 'D3', 'D4']
  #
  #   board.place(cruiser, ["A1", "A2", "A3"])
  #
  #   submarine = Ship.new("Submarine", 2)
  #
  #   board.valid_placement?(submarine, ["A1", "B1"])

  #   "expected = "?
  #
  #   assert_equal board.place(cruiser, ["A1", "A2", "A3"])
  #
  # end

  def test_can_render_board
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expected1 = "  1 2 3 4 \n A . . . . \n B . . . . \n C . . . . \n D . . . . \n"
    assert_equal expected1, board.render

    board.place(cruiser, ["A1", "A2", "A3"])
    board.place(submarine, ["B3, B4"])

    expected2 = "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n"
    
    assert_equal expected2, board.render(true)
  end

  # def test_can_render_hits
  #   board = Board.new
  #   cell = Cell.new("A1")
  #   cruiser = Ship.new("Cruiser", 3)
  #   submarine = Ship.new("Submarine", 2)
  #
  #   board.place(cruiser, ["A1", "A2", "A3"])
  #
  #   board.place(submarine, ["B3", "B4"])
  #   cruiser.hit
  #
  #   expected = "  1 2 3 4 \n A H S S . \n B . . S S \n C . . . . \n D . . . . \n"
  #
  #   assert_equal expected, board.render(true)
  #
  # end
end
