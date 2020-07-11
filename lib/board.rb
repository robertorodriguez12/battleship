require 'pry'

# ask instructors what "very little code outside of class" means for testing
# very detailed testing - longer - especially for testing the hash
class Board
  attr_reader :cells

  LETTERS = ['A', 'B', 'C', 'D']
  NUMBERS = ['1', '2', '3', '4']

  def initialize
    @cells = {}
    generate_cells
    # binding.pry
  end

  def generate_cells
    LETTERS.each do |letter|
      NUMBERS.each do |number|
        @cells[letter+number] = Cell.new(letter + number)
      end
    end
  end

  def valid_coordinate?(key)
    @cells.has_key?(key)
  end

  def valid_placement?(ship, coordinate_array)
    # we check valid placement by arguing ship&attributes
    # and the array of 2-3 coordinates
    # ship length and coordinate_array length must be equal
    return false if ship.length != coordinate_array.length
    # Ship has to be either horizontally or vertically placed, AND must not overlap with another ship
    (valid_horizontal_placement?(coordinate_array) || valid_vertical_placement?(coordinate_array)) &&
    no_overlap?(coordinate_array)
    # "return false if" statement - we don't use end?
  end

  def valid_letters?(coordinates)
    # iterate using map, store coordinates into letters variable
    letters = coordinates.map do |coordinate|
      # block variable isolates each element  -as a string?
      # split ex. "A4" into "A", "4"
      # take first character and return .ord code point
      coordinate.split("").first.ord
    end

    letters.each_cons(2).all? do |first, second|
      first + 1 == second
    end
  end

  def valid_numbers?(coordinates)
    numbers = coordinates.map do |coordinate|
      coordinate.split("")[1].ord
    end
    numbers.each_cons(2).all? do |first, second|
      first + 1 == second
    end
  end

  def valid_horizontal_placement?(coordinates)
    letters = coordinates.map do |coordinate|
      coordinate.split("")[0].ord
    end
    numbers = coordinates.map do |coordinate|
      coordinate.split("")[1].ord
    end
    valid_letters = letters.each_cons(2).all? do |first, second|
      first == second
    end
    valid_numbers = numbers.each_cons(2).all? do |first, second|
      first + 1 == second
    end
    valid_letters && valid_numbers
  end

  def valid_vertical_placement?(coordinates)
    letters = coordinates.map do |coordinate|
      coordinate.split("")[0].ord
    end
    numbers = coordinates.map do |coordinate|
      coordinate.split("")[1].ord
    end
    valid_letters = letters.each_cons(2).all? do |first, second|
      first + 1 == second
    end
    valid_numbers = numbers.each_cons(2).all? do |first, second|
      first == second
    end
    valid_letters && valid_numbers
  end

  def no_overlap?(coordinate_array)
    coordinate_array.all? do |coordinate|
      @cells[coordinate].empty?
    end
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
    end
      end
  end

  def render(render_ship = false)
    row = ['A', 'B', 'C', 'D']
    row_index = 0
    # add space before 1 below
    @cells.values.each_slice(4).reduce("  1 2 3 4") do |acc, cells|
      x = cells.map do |cell|
        if render_ship
          "#{cell.render(true)} "
        else
          "#{cell.render} "
        end

      end.join
      acc = acc + "\n #{row[row_index].to_s} " + x.strip
      row_index += 1
      acc
    end.concat("\n")

  end
end
