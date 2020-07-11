
class Board
  attr_reader :cells

  LETTERS = ['A', 'B', 'C', 'D']
  NUMBERS = ['1', '2', '3', '4']

  def initialize
    @cells = {}
    generate_cells
  end

  def generate_cells
    LETTERS.each do |letter|
      NUMBERS.each do |number|
        @cells[letter+number] = Cell.new(letter + number)
      end
    end
  end


  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def valid_placement?(ship, coordinate_array)
    return false if ship.length != coordinate_array.length
    # binding.pry
    # valid_letters?(coordinate_array) &&
    # valid_numbers?(coordinate_array) &&
    (valid_horizontal_placement?(coordinate_array) || valid_vertical_placement?(coordinate_array)) &&
    no_overlap?(coordinate_array)

    # coord_array = []
    # coordinate_array.each do |coordinate|
    #   coord_array << coordinate.chars
    # end
    # coord_letter = coord_array[0][0]
    # coord_array.each do |split_coord|
    #   if split_coord[0] == coord_letter
    #     return true
    #   else
    #     return false
    #   end
    # end

    # coordinate_array.length == ship.length

  end

  def valid_letters?(coordinates)
    letters = coordinates.map do |coordinate|
    coordinate.split("").first.ord
    end
    letters.each_cons(2).all? do |first, second|
      first + 1 == second
    end
    # binding.pry

  end

  def valid_numbers?(coordinates)
    numbers = coordinates.map do |coordinate|
    coordinate.split("")[1].ord
    end
    numbers.each_cons(2).all? do |first, second|
      first + 1 == second
    end
    # binding.pry

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

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end
    end

  end

  def valid_vertical_placement?(coordinates)
    letters = coordinates.map do |coordinate|
    coordinate.split("")[0].ord
    end
    numbers = coordinates.map do |coordinate|
    coordinate.split("")[1].ord
    end
    #each_cons(2) breaks arrays down into groups of 2.
    valid_letters = letters.each_cons(2).all? do |first, second|
      first + 1 == second
    end
    valid_numbers = numbers.each_cons(2).all? do |first, second|
      first == second
    end
    valid_letters && valid_numbers

  end

  def  no_overlap?(coordinate_array)
    coordinate_array.all? do |coordinate|
      @cells[coordinate].empty?
    end
  end

  def render(render_ship = false)
    row = ['A', 'B', 'C', 'D']
    row_index = 0
    @cells.values.each_slice(4).reduce("  1 2 3 4") do |acc, cells|
      x = cells.map do |cell|
        if render_ship
          "#{cell.render(true)} "
        else
          "#{cell.render} "
        end

      end.join
      # binding.pry
      acc = acc + "\n #{row[row_index].to_s} " + x.strip
      row_index += 1
      acc
    end.concat("\n")

  end


end
