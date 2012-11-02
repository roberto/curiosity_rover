class Position
  attr_reader :x, :y

  def initialize(x,y)
    @x, @y = x.to_i, y.to_i
  end

  def move_to(direction)
    case direction
    when :north then @y+=1
    when :south then @y-=1
    when :east  then @x+=1
    when :west  then @x-=1
    end
  end

  def ==(other)
    self.x == other.x && self.y == other.y
  end

  def to_s
    "#@x #@y"
  end

  class << self
    def setup_boundary(x, y)
      @@boundary = Position.new(x,y)
    end

    def boundary
      @@boundary ||= nil
    end
  end

end
