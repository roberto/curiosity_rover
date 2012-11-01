require_relative 'spec_helper'
require_relative '../lib/robot'

describe Robot do
  
  describe "constructor" do
    before do
      @position = Position.new(3,5)
      @direction = :north
      @robot = Robot.new(@position, @direction)
    end

    it "must setup position" do
      @robot.position.must_equal @position
    end

    it "must setup direction" do
      @robot.direction.must_equal @direction
    end
  end

  describe "teleport" do
    before do
      @old_position = Position.new(1,2)
      @old_direction = :south
      @new_position = Position.new(4,10)
      @robot = Robot.new(@old_position, @old_direction)

      @robot.teleport(@new_position)
    end

    it "must move robot to new position" do
      @robot.position.must_equal @new_position
    end

    it "must keep same direction" do
      @robot.direction.must_equal @old_direction
    end
  end



end
