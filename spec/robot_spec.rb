require_relative 'spec_helper'
require_relative '../lib/robot'

describe Robot do
  before do
    Area.instance.setup(20,20)
  end
  
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

  describe "turn_right" do
    must_turn_right(from: :north, to: :east)
    must_turn_right(from: :east,  to: :south)
    must_turn_right(from: :south, to: :west)
    must_turn_right(from: :west,  to: :north)
  end

  describe "turn_left" do
    must_turn_left(from: :north, to: :west)
    must_turn_left(from: :west,  to: :south)
    must_turn_left(from: :south, to: :east)
    must_turn_left(from: :east,  to: :north)
  end

  describe "move_forward" do
    before do
      @position = MiniTest::Mock.new
      @robot = Robot.new(@position, :north)
    end

    it "must call position.move_to with direction as argument" do
      @position.expect :move_to, ret = nil, args = [:north]
      @robot.move_forward
      @position.verify
    end
  end

  describe "teleport" do
    before do
      @old_position = Position.new(1,2)
      @old_direction = :south
    end

    context "valid new position" do
      before do
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

    context "invalid new position" do
      before do
        @new_position = Position.new(500,500)
        @robot = Robot.new(@old_position, @old_direction)

        @robot.teleport(@new_position)
      end
      it "must keep same position" do
        @robot.position.must_equal @old_position
      end
    end
  end

  describe "to_s" do
    before do
      @robot = Robot.new(Position.new(7,10), :west)
    end
    it "must return position and direction" do
      @robot.to_s.must_equal "7 10 W"
    end
  end
end
