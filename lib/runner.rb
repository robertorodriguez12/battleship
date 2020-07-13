require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'


game = Game.new("Human Player", "AI")
game.start
