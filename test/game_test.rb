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

    assert game.place_ai_ships
  end

  def test_ai_has_turns
    game = Game.new
    game.start

    assert game.ai_turn
  end

  def test_board_can_report_conditions
    game = Game.new

    @human_board.cells[ai_fire_grid].empty? == true

    assert_equal puts "My shot on #{ai_fire_grid} was a miss.", game.show_ai_shot_results
  end

  # def test_game_ends
  #
  # end

  # def test_game_goes_back_to_menu
  # end


end
