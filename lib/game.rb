require 'pry'
require './lib/cell'
require './lib/ship'
require './lib/board'

class Game
  attr_reader :human, :turn, :start, :ai, :place_human_cruiser, :place_human_submarine, :board

  def initialize
    @human = 'Human Player'
    @ai = ai
    @human_board = Board.new
    @turn = turn
    @start = false
    @ai_board = Board.new
    @human_submarine_placement = []
    @human_cruiser_placement = []
    @human_cruiser = Ship.new("Cruiser", 3)
    @human_submarine = Ship.new("Submarine", 2)
    @ai_cruiser = Ship.new("Cruiser", 3)
    @ai_submarine = Ship.new("Submarine", 2)

  end

  def place_ai_ships
    submarine_placement = [@ai_board.cells.keys.sample, @ai_board.cells.keys.sample]
    cruiser_placement = [@ai_board.cells.keys.sample, @ai_board.cells.keys.sample, @ai_board.cells.keys.sample]
    until @ai_board.valid_placement?(@ai_submarine, submarine_placement)
      submarine_placement = [@ai_board.cells.keys.sample, @ai_board.cells.keys.sample]
    end
    @ai_board.place(@ai_submarine, submarine_placement)
    until @ai_board.valid_placement?(@ai_cruiser, cruiser_placement)
      cruiser_placement = [@ai_board.cells.keys.sample, @ai_board.cells.keys.sample, @ai_board.cells.keys.sample]
    end
    @ai_board.place(@ai_cruiser, cruiser_placement)
  end

  def ai_turn
    ai_fire_grid = @human_board.cells.keys.sample
    until @human_board.valid_coordinate?(ai_fire_grid) == true && @human_board.cells[ai_fire_grid].fired_upon? == false
      ai_fire_grid = @human_board.cells.keys.sample
    end
    @human_board.cells[ai_fire_grid].fire_upon
    show_ai_shot_results(ai_fire_grid)
  end

  def show_ai_shot_results(ai_fire_grid)
    if @human_board.cells[ai_fire_grid].empty? == true
      puts "My shot on #{ai_fire_grid} was a miss."
      puts "---------- AI Board -----------"
    elsif @human_board.cells[ai_fire_grid].ship.sunk? == true
      puts "My shot on #{ai_fire_grid} sunk your #{@human_board.cells[ai_fire_grid].ship.name}."
      puts "---------- AI Board -----------"
    else @human_board.cells[ai_fire_grid].empty? == false
      puts "My shot on #{ai_fire_grid} was a hit."
      puts "---------- AI Board -----------"
    end
  end

  def human_turn
    print @ai_board.render
    puts "---------- Your Board -----------"
    print @human_board.render(true)
    puts "AI has fired on you! Enter the coordinate for your shot:"
    shot_coordinate = gets.chomp
    until @ai_board.valid_coordinate?(shot_coordinate) == true && @ai_board.cells[shot_coordinate].fired_upon? == false
      if @ai_board.valid_coordinate?(shot_coordinate) == true && @ai_board.cells[shot_coordinate].fired_upon? == true
          puts "You have already fired upon this coordinate. Please enter a different one."
          shot_coordinate = gets.chomp
      else @ai_board.valid_coordinate?(shot_coordinate) == false
          puts "Please enter a valid coordinate:"
          shot_coordinate = gets.chomp
      end
    end
    @ai_board.cells[shot_coordinate].fire_upon
    show_human_shot_results(shot_coordinate)
  end


  def show_human_shot_results(shot_coordinate)
    if @ai_board.cells[shot_coordinate].empty? == true
      puts "Your shot on #{shot_coordinate} was a miss."
      # puts "---------- Your Board -----------"
    elsif @ai_board.cells[shot_coordinate].ship.sunk? == true
      puts "Your shot on #{shot_coordinate} sunk my #{@ai_board.cells[shot_coordinate].ship.name}."
      # puts "---------- Your Board -----------"
    else @ai_board.cells[shot_coordinate].empty? == false
      puts "Your shot on #{shot_coordinate} was a hit."
      # puts "---------- Your Board -----------"

    end
  end

  def have_turns
    until game_over? == true
      puts "---------- AI Board -----------"
      print @ai_board.render
      puts "---------- Your Board -----------"
      print @human_board.render(true)
      ai_turn
      break if game_over? == true
      human_turn
    end
  end

  def game_over?
    (@ai_cruiser.sunk? == true && @ai_submarine.sunk? == true) || (@human_cruiser.sunk? == true && @human_submarine.sunk? == true)
  end

  def place_human_cruiser(user_input)
    user_input = user_input.split(" ")
    @human_cruiser_placement << user_input
  end

  def place_human_submarine(user_input)
    user_input = user_input.split(" ")
    @human_submarine_placement << user_input
  end

  def winner
    if game_over? == true
      return "The Smarter Player Won....(hint: It wasn't you!!!!)" if @human_cruiser.sunk? == true && @human_submarine.sunk? == true
      return "You Won!!!" if @ai_cruiser.sunk? == true && @ai_submarine.sunk? == true
    end
  end

  def start
    place_ai_ships
    greeting = "Welcome to BATTLESHIP"
    puts greeting
    puts "Enter 'p' to play or 'q' to quit."
    print "> "
    answer = gets.chomp

    if answer == 'p'
      @start = true
    elsif answer == 'q'
      puts "Thank you for trying...I'd be scared of playing against me also."
    end

    if @start
      puts "---------- Your Board -----------"
      print @human_board.render

      puts "AI has laid out their ships on the grid"
      puts "You now need to lay out your two ships."
      puts "The Cruiser is three units long and the Submarine is two units long."

      puts "Enter the cells for the Cruiser (3 Spaces): ex. A1 A2 A3, no commas"
      print "> "

      user_input = gets.chomp
      place_human_cruiser(user_input)
      until @human_board.valid_placement?(@human_cruiser, @human_cruiser_placement.flatten!)

        puts "Those are invalid coordinates. Please try again:"
        puts "Enter the cells for the Cruiser (3 Spaces): ex. A1 A2 A3, no commas"
        print "> "
        @human_cruiser_placement = []
        user_input = gets.chomp
        place_human_cruiser(user_input)
      end
      @human_board.place(@human_cruiser, @human_cruiser_placement)

      print @human_board.render(true)

      puts "Enter the cells for the Submarine (2 Spaces) ex. D1 D2 or B2 C2, no commas"
      print "> "

      user_input = gets.chomp

      place_human_submarine(user_input)

      until @human_board.valid_placement?(@human_submarine, @human_submarine_placement.flatten!)
        puts "Those are invalid coordinates. Please try again:"
        puts "Enter the cells for the Submarine (2 Spaces): ex. A1 A2, no commas"
        print "> "
        @human_submarine_placement = []
        user_input = gets.chomp
        place_human_submarine(user_input)
      end
      @human_board.place(@human_submarine, @human_submarine_placement)
      while game_over? == false
        have_turns
      end
      print winner

    end

  end
end
