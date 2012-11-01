require_relative 'position'

class Robot
  attr_reader :direction, :position

  def initialize(position, direction)
    @position, @direction = position, direction
  end

  def teleport(new_position)
    @position = new_position
  end

end
