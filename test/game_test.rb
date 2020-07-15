require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game'
require 'pry'

class GameTest < MiniTest::Test
  attr_reader :game

  def test_it_exists
    game = Game.new

    assert_instance_of Game, game
  end

  def test_ai_can_place_ships
    game = Game.new

    game.place_ai_ships
    binding.pry
    assert_equal
  end

  # def test_board_can_render_different_conditions
  # end

  # def test_board_can_report_conditions
  # end

  # def test_game_ends
  # end

  # def test_game_goes_back_to_menu
  # end


end
