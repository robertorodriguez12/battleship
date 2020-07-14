require 'pry'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/board'


class Game
  attr_reader :human, :turn, :start, :ai, :place_human_cruiser, :place_human_submarine, :board

  def initialize
    @human = 'Human Player'
    @ai = ai
    @board = Board.new
    @turn = turn
    @start = false
    @computer_board = Board.new
    @human_submarine_placement = []
    @human_cruiser_placement = []
    @human_cruiser = Ship.new("Cruiser", 3)
    @human_submarine = Ship.new("Submarine", 2)

  end

  def ai_turn
    ai_fire_grid = [@board.cells.keys.sample]
    until @board.cells.keys.cell.fired_upon? == false
      ai_fire_grid.cell.fire_upon
    end
  end

  def human_turn(answer)
    print @computer_board.render
    print @board.render(true)
  end

  def place_computer_ships
    ai_cruiser = Ship.new("Cruiser", 3)
    ai_submarine = Ship.new("Submarine", 2)
    submarine_placement = [@computer_board.cells.keys.sample, @computer_board.cells.keys.sample]
    cruiser_placement = [@computer_board.cells.keys.sample, @computer_board.cells.keys.sample, @computer_board.cells.keys.sample]
    until @computer_board.valid_placement?(ai_submarine, submarine_placement)
      submarine_placement = [@computer_board.cells.keys.sample, @computer_board.cells.keys.sample]
    end
    @computer_board.place(ai_submarine, submarine_placement)
    until @computer_board.valid_placement?(ai_cruiser, cruiser_placement)
      cruiser_placement = [@computer_board.cells.keys.sample, @computer_board.cells.keys.sample, @computer_board.cells.keys.sample]
    end
    @computer_board.place(ai_cruiser, cruiser_placement)

  end

  def place_human_cruiser(user_input)
    user_input = user_input.split(" ")
    @human_cruiser_placement << user_input
  end

  def place_human_submarine(user_input)
    user_input = user_input.split(" ")
    @human_submarine_placement << user_input
  end



  def start
    place_computer_ships
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

    if @start
      print @board.render

      puts "AI has laid out their ships on the grid"
      puts "You now need to lay out your two ships."
      puts "The Cruiser is three units long and the Submarine is two units long."

      puts "Enter the squares for the Cruiser (3 Spaces):"
      print "> "

      user_input = gets.chomp
      place_human_cruiser(user_input)
      until @board.valid_placement?(@human_cruiser, @human_cruiser_placement.flatten!)

        puts "Those are invalid coordinates. Please try again:"
        puts "Enter the cells for the Cruiser (3 Spaces): For example A1 A2 A3 (no commas)"
        print "> "
        @human_cruiser_placement = []
        user_input = gets.chomp
      end
      @board.place(@human_cruiser, @human_cruiser_placement)
      
      print @board.render(true)

      puts "Enter the squares for the Submarine (2 Spaces)"
      print "> "

      user_input = gets.chomp

      place_human_submarine(user_input)

      until @board.valid_placement?(@human_submarine, @human_submarine_placement.flatten!)
        puts "Those are invalid coordinates. Please try again:"
        puts "Enter the cells for the Submarine (2 Spaces): For example A1 A2(no commas)"
        print "> "
        @human_submarine_placement = []
        user_input = gets.chomp
        place_human_submarine(user_input)
      end
      @board.place(@human_submarine, @human_submarine_placement)
      
      print @board.render(true)

      binding.pry
      until (@human_cruiser.sunk? == true && @human_submarine.sunk? == true) || (@ai_cruiser.sunk? == true && @ai_submarine.sunk? == true)
        ai_turn
        puts "The AI has taken their turn, choose the coordinate you would like to fire upon."
        answer = gets.chomp

        human_turn(answer)

      end



    end
  end

  game = Game.new
  game.start

#create until statement to run through turns until game is over.

  #
  #
  #   puts "Place your Cruiser by entering coordinates, example 'A1, A2, A3'"
  #   print '> '
  #   cruiser_placement = gets.chomp
  #
  #
  #   # computer generates random placement of two ships
  #     # get hash keys as array, create 2 arrays - one with 2 elements, one with 3
  #     # computer_cruiser/computer_submarine = .sample(2-3) method
  #     # ^ chooses specified # of elements
  #     # use .place to put on board
  #   # display message to user & use .render to show board
  #     # gets.chomp to place cruiser and submarine
  #     # return invalid coordinate message if needed
  #       # nested if statement?
  #
  #
  # end
  #
  #




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


end
