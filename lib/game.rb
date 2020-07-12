require 'pry'
require './lib/board'
require './lib/cell'
require './lib/ship'


class Game
  attr_reader :player, :turn, :start

  def initialize(human_player, computer_player)
    @human_player = human_player
    @computer_player = computer_player
    @turn = turn
    @start = false

  end

  def start
  greeting = "Welcome to BATTLESHIP"
  puts greeting
  puts "Enter 'p' to play or 'q' to quit."
  print "> "
  answer = gets.chomp

  if answer == 'p'
    @start = true
  elsif answer == 'q'
    puts "Please enter p to play."
  end




  end



end
