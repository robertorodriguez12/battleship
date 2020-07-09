require 'pry'
require './lib/cell'
require './lib/ship'

class Board
  attr_reader :cells

  LETTERS = ['A', 'B', 'C', 'D']
  NUMBERS = ['1', '2', '3', '4']

  def initialize
    @cells = {}
    generate_cells
  end

  def generate_cells
    LETTERS.each do |letter|
      NUMBERS.each do |number|
        @cells[letter+number] = Cell.new(letter + number)
      end
    end
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def valid_placement?(ship, coordinate)
    coordinate == ship.length
  end

end
