require 'pry'
require './lib/cell'

# ask instructors what "very little code outside of class" means for testing
# very detailed testing - longer - especially for testing the hash
class Board
  attr_reader :cells

  def initialize
    @cells = cells
    # @letters = [:A, :B, :C, :D]
    # @numbers = ['1', '2', '3', '4']
  end

  def cell_hash
    @cells = {
     "A1" => Cell.new("A1"),
     "A2" => Cell.new("A2"),
     "A3" => Cell.new("A3"),
     "A4" => Cell.new("A4"),
     "B1" => Cell.new("B1"),
     "B2" => Cell.new("B2"),
     "B3" => Cell.new("B3"),
     "B4" => Cell.new("B4"),
     "C1" => Cell.new("C1"),
     "C2" => Cell.new("C2"),
     "C3" => Cell.new("C3"),
     "C4" => Cell.new("C4"),
     "D1" => Cell.new("D1"),
     "D2" => Cell.new("D2"),
     "D3" => Cell.new("D3"),
     "D4" => Cell.new("D4")
    }
  end

# Google - how to create actual objects INSIDE class
  # OOP -
  # if we want to define this hash outside our init, we'd have to make a method
end
