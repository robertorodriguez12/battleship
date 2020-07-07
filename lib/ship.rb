class Ship
  attr_reader :name, :size, :health

  def initialize(name, size)
    @name = name
    @size = size
    @health = @size

  end

  # def health
  #   @health = @size
  # end

  def has_sunk?
    @health < 1

  end

  def hit
    @health -= 1
  end


end
