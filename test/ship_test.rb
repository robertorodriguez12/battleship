require 'minitest/autorun'
require 'minitest/nyan_cat'
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
    assert_equal 3, ship1.size
    assert_equal 2, ship2.size

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

    assert_equal false, ship1.has_sunk?
    assert_equal true, ship2.has_sunk?

  end

  def test_it_can_be_hit
    ship1 = Ship.new("Cruiser", 3)
    ship2 = Ship.new("Submarine", 2)

    # ship1.hit

    assert_equal 2, ship1.hit

    # ship1.hit

    assert_equal 1, ship1.hit

    assert_equal 1, ship2.hit

    assert_equal 0, ship2.hit

    assert_equal false, ship1.has_sunk?
    assert_equal true, ship2.has_sunk?

  end

end
