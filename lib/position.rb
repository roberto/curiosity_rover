require_relative 'area'

class Position
  attr_reader :x, :y

  def initialize(x, y)
    @x, @y = x.to_i, y.to_i
  end

  def move_to(direction)
    backup
    case direction
    when :north then @y+=1
    when :south then @y-=1
    when :east  then @x+=1
    when :west  then @x-=1
    end
    rollback unless valid?
  end

  def valid?
    Area.instance.inside?(self)
  end

  def ==(other)
    self.x == other.x && self.y == other.y
  end

  def to_s
    "#@x #@y"
  end

  private

  def backup
    @_x, @_y = @x, @y
  end

  def rollback
    @x, @y = @_x, @_y
  end

end
