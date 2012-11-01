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
