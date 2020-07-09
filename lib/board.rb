require 'pry'
require './lib/cell'

class Board
  attr_reader :cells, :letters, :numbers, :cell

  def initialize
    @cell = cell
    @cells = {}
    @letters = ['A', 'B', 'C', 'D']
    @numbers = ['1', '2', '3', '4']
  end

  def generate_cells
    @letters.each do |letter|
      @numbers.each do |number|
        @cells[letter+number] = Cell.new(letter + number)
      end
    end
  end

end
