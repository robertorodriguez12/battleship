require 'pry'
require './lib/cell'
require './lib/board'
require './lib/game'

class Ship
  attr_reader :name, :length
  attr_accessor :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = @length
    @sunk = false
  end

  def sunk?
    @health <= 0
  end

  def hit
    @health -= 1
  end


end
