require 'minitest/autorun'
require 'minitest/nyan_cat'
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


end
