require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require 'pry'

class ShipTest < MiniTest::Test

  def test_ship_exists
    ship = Ship.new("Cruiser", 3)

    assert_instance_of Ship, ship

  end

  def test_it_has_attributes
    ship1 = Ship.new("Cruiser", 3)
    ship2 = Ship.new("Submarine", 2)

    assert_equal "Cruiser", ship1.name
    assert_equal "Submarine", ship2.name
    assert_equal 3, ship1.length
    assert_equal 2, ship2.length

  end

  def test_ship_has_health
    ship1 = Ship.new("Cruiser", 3)
    ship2 = Ship.new("Submarine", 2)

    assert_equal 3, ship1.health
    assert_equal 2, ship2.health

  end

  def test_ship_has_sunk?
    ship1 = Ship.new("Cruiser", 3)
    ship2 = Ship.new("Submarine", 0)

    assert_equal false, ship1.sunk?
    assert_equal true, ship2.sunk?

  end

  def test_cruiser_can_be_hit
    cruiser = Ship.new("Cruiser", 3)


    cruiser.hit
    assert_equal 2, cruiser.health

    # ship1.hit
  end
end
