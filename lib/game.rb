require 'pry'
require './lib/board'
require './lib/cell'
require './lib/ship'

class Game
  attr_reader :user, :turn, :start
  # don't include :start? Already defining method below


  human_cruiser = Ship.new("Cruiser", 3)
  human_submarine = Ship.new("Submarine", 2)


  human_board = Board.new
  computer_board = Board.new

  def initialize(user, computer)
    @user = user
    @ai = ai
    @board = Board.new
    @turn = turn
    @start = false

  end

  def place_computer_ships
    ai_cruiser = Ship.new("Cruiser", 3)
    ai_submarine = Ship.new("Submarine", 2)
    potential_submarine_placement = [@board.cells.keys.sample, @board.cells.keys.sample]
    #use until valid placement
    until @board.valid_placement?(ai_submarine, potential_submarine_placement)
      potential_submarine_placement = [@board.cells.keys.sample, @board.cells.keys.sample]
    end
    @board.place_ship(ai_submarine, potential_submarine_placement)
    until @board.valid_placement?(ai_cruiser, potential_cruiser_placement)
      potential_cruiser_placement = [@board.cells.keys.sample, @board.cells.keys.sample, @board.cells.keys.sample]
    end
    @board.place_ship(ai_cruiser, potential_cruiser_placement)

  end


  def start
    place_computer_ships
    binding.pry
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

  # should computer/user placement be a separate method?
  if @start == true
    puts ""


    puts "Place your Cruiser by entering coordinates, example 'A1, A2, A3'"
    print '> '
    cruiser_placement = gets.chomp


    # computer generates random placement of two ships
      # get hash keys as array, create 2 arrays - one with 2 elements, one with 3
      # computer_cruiser/computer_submarine = .sample(2-3) method
      # ^ chooses specified # of elements
      # use .place to put on board
    # display message to user & use .render to show board
      # gets.chomp to place cruiser and submarine
      # return invalid coordinate message if needed
        # nested if statement?


  end



end



# Do we need to create cell instances?

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
