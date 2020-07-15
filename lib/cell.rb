require './lib/ship'
require './lib/board'
require './lib/game'
require 'pry'

class Cell
  attr_reader :coordinate, :has_ship, :fired_upon, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @fired_upon = false
    @ship = nil
  end

  def empty?
    return false if @ship
    return true
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    return @ship.health -= 1 if @ship
  end

  def render(default = false)
    return "M" if fired_upon? && empty?
    return "." if default == false && fired_upon? == false
    return "." if default == true && fired_upon? == false && empty?
    return "S" if fired_upon? == false && default == true && empty? == false && ship.sunk? == false
    return "H" if fired_upon? == true && @ship.sunk? == false && empty? == false
    return "H" if fired_upon? && @ship.sunk? == false && empty? == false
    return "X" if empty? == false && @ship.sunk?
  end

end
