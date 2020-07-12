require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game'
require 'pry'

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new("Human", "Computer")

    assert_instance_of Game, game
  end
end
