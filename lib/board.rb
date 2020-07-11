require 'pry'

# ask instructors what "very little code outside of class" means for testing
# very detailed testing - longer - especially for testing the hash
class Board
  attr_reader :cells

  LETTERS = ['A', 'B', 'C', 'D']
  NUMBERS = ['1', '2', '3', '4']

  def initialize
    @cells = {}
    generate_cells
    # binding.pry
  end

  def generate_cells
    LETTERS.each do |letter|
      NUMBERS.each do |number|
        @cells[letter+number] = Cell.new(letter + number)
      end
    end
  end

  def valid_coordinate?(key)
    @cells.has_key?(key)
  end

  def valid_placement?(ship, coordinate_array) # we check valid placement by arguing ship&attributes
    # and the array of 2-3 coordinates
    # ship length and coordinate_array length must be equal
    return false if ship.length != coordinate_array.length
    # Ship has to be either horizontally or vertically place, AND must not overlap with another ship
    (valid_horizontal_placement?(coordinate_array) || valid_vertical_placement(coordinate_array)) &&
    no_overlap?(coordinate_array)
    # "return false if" statement - we don't use end?
  end
end
