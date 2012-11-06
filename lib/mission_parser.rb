class MissionParser
  attr_reader :robot

  DIRECTIONS = { "N" => :north, "S" => :south, "W" => :west, "E" => :east }

  def initialize(input)
    @lines = input.lines
  end

  def run
    setup_boundary(@lines.next)
    setup_robot(@lines.next)
    loop do
      line = @lines.next
      line.start_with?("T") ? parse_teleport(line) : parse_instructions(line)
    end
  rescue StopIteration
  ensure
    return @robot
  end

  private

  def setup_boundary(line)
    line.scan(/(\d+)\s(\d+)/) do |width, height|
      Area.instance.setup(width, height)
    end
  end

  def setup_robot(line)
    line.scan(/(\d+)\s(\d+)\s(\D)/) do |x, y, direction|
      @robot = Robot.new(Position.new(x, y), DIRECTIONS[direction])
    end
  end

  def parse_instructions(line)
    line.each_char do |char|
      case char
      when 'L' then @robot.turn_left
      when 'R' then @robot.turn_right
      when 'M' then @robot.move_forward
      end
    end
  end

  def parse_teleport(line)
    line.scan(/T\s(\d+)\s(\d+)/) do |x, y|
      @robot.teleport(Position.new(x, y))
    end
  end
end
