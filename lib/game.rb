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

# when firing a shot, display result to user
# after user chooses to play, place both players' ships to set up
# computer = random placement of ships (random element in keys array)
# explanation of how to put ships in valid placements
# invalid placement message to user if applicable

# Single turn consists of:
  # displaying boards
  # player chooses coordinate to fire on
  # computer chooses coodinate to fire on
  # report results of player's shot
  # report results of computer's shot
      # and render board(s) accordingly

# start of turn: user shown both boards but not computer's ships
# user input: ask for a coordinate to fire upon
# computer fires on a space but not one that's already fired upon
# game over when both of one player's ships are sunk
  # display message: You won, or I won!
# return to main menu
