module Factories

  def create_robot(attrs)
    attrs = {position: Position.new(2,3), direction: :north}.merge(attrs)
    Robot.new(*attrs.values)
  end

end

