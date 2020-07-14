# require 'pry'

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
    return @sunk = true if @health < 1
    return @sunk
  end

  def hit
    @health -= 1
  end


end
