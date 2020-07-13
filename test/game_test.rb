require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game'
require './lib/runner'

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new("Human", "Computer")

    assert_instance_of Game, game
  end
  # 
  # def test_user_can_place_ships
  # end

end
