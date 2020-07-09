require 'pry'

# ask instructors what "very little code outside of class" means for testing
# very detailed testing - longer - especially for testing the hash
class Board
  attr_reader :cells

  LETTERS = ['A', 'B', 'C', 'D']
  NUMBERS = ['1', '2', '3', '4']

  def initialize
    @cells = {}
  end

  def generate_cells
    LETTERS.each do |letter|
      NUMBERS.each do |number|
        @cells[letter+number] = Cell.new(letter + number)
      end
    end
  end
end
