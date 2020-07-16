require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'

class CellTest < MiniTest::Test
  def test_cell_exists
    cell = Cell.new("B4")

    assert_instance_of Cell, cell

  end

  def test_it_has_a_coordinate
    cell = Cell.new("B4")

    assert_equal "B4", cell.coordinate
  end

  def test_cell_starts_with_no_ship_by_default
    cell = Cell.new("B4")

    assert_equal true, cell.empty?

  end

  def test_can_place_ship
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    assert_equal false, cell.empty?
  end

  def test_it_has_been_fired_upon
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    assert_equal false, cell.fired_upon?

    cell.fire_upon

    assert_equal true, cell.fired_upon?
    assert_equal 2, cell.ship.health

  end

  def test_it_can_render_empty_cell
    cell_1 = Cell.new("B4")

    assert_equal ".", cell_1.render
  end

  def test_it_can_render_miss
    cell_1 = Cell.new("B4")

    cell_1.fire_upon

    assert_equal "M", cell_1.render

  end

  def test_it_can_render_true
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)

    assert_equal ".", cell_2.render
    assert_equal "S", cell_2.render(true)


  end

  def test_it_can_render_hit
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)
    cell_2.fire_upon

    assert_equal "H", cell_2.render

  end


  def test_it_can_render_sunk
    cell_2 = Cell.new("C3")
    cell_3 = Cell.new("A1")
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    cell_2.place_ship(cruiser)
    cell_2.fire_upon

    assert_equal false, cruiser.sunk?

    cruiser.hit
    cruiser.hit

    assert_equal true, cruiser.sunk?
    assert_equal "X", cell_2.render

    cell_3.place_ship(submarine)
    cell_3.fire_upon

    assert_equal false, submarine.sunk?

    submarine.hit

    assert_equal true, submarine.sunk?
    assert_equal "X", cell_3.render
  end

end
