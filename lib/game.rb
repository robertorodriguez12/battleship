require 'pry'
require './lib/board'
require './lib/cell'
require './lib/ship'


class Game
  attr_reader :player, :turn

  def initialize(human_player, computer_player)
    @human_player = human_player
    @computer_player = computer_player
    @turn = turn
    @start = false

  end

  def start
    greeting = puts "Welcome to BATTLESHIP"
    puts "Enter 'p' to play or 'q' to quit."
    answer = gets.chomp

    # if 'p'


  end

end
