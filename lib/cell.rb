require './lib/ship'
require 'pry'

class Cell
  attr_reader :coordinate, :has_ship, :fired_upon, :ship
  # attr_reader only for referencing/returning variab;es outside class?

#
  def initialize(coordinate)
    @coordinate = coordinate
    @fired_upon = false
    @ship = nil
  end

  def empty?
    return false if @ship
    return true

  end

# Are we actually placing the ship somewhere on a coordinate?

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
    # we are not using methods on objects because we are just returning letter to terminal
    # we are in the cell class so we don't need to reference anything in another class to use these methods
    return "M" if fired_upon? && empty?
    return "." if default == false && fired_upon? == false
    return "S" if fired_upon? == false && default == true
    return "H" if fired_upon? && ship.sunk? == false
    return "X" if ship.sunk?
  end

end
