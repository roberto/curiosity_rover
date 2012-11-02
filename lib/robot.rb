require_relative 'position'

class Robot
  DIRECTIONS = [:north, :east, :south, :west]

  attr_reader :direction, :position

  def initialize(position, direction)
    @position, @direction = position, direction
  end

  def teleport(new_position)
    @position = new_position if new_position.valid?
  end

  def turn_right
    @direction = DIRECTIONS[DIRECTIONS.index(@direction) + 1] || :north
  end

  def turn_left
    @direction = DIRECTIONS[DIRECTIONS.index(@direction) - 1]
  end

  def move_forward
    @position.move_to(@direction)
  end

  def to_s
    "#@position #{@direction.to_s[0].upcase}"
  end

end
