require_relative 'spec_helper'

describe Robot do
  before do
    Area.instance.setup(20,20)
  end

  describe "constructor" do
    before do
      @position = Position.new(3,5)
      @direction = :north
    end
    let(:robot) { Robot.new(@position, @direction) }

    it "must setup position" do
      robot.position.must_equal @position
    end

    it "must setup direction" do
      robot.direction.must_equal @direction
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
    let(:position) { MiniTest::Mock.new }
    let(:current_direction) { :north }
    let(:robot) { Robot.new(position, :north) }

    it "must call position.move_to with current direction as argument" do
      position.expect :move_to, ret = nil, args = [current_direction]
      robot.move_forward
      position.verify
    end
  end

  describe "teleport" do
    let(:old_position)  { Position.new(1,2) }
    let(:old_direction) { :south }
    let(:robot)         { Robot.new(old_position, old_direction) }

    context "valid new position" do
      let(:new_position) { Position.new(4, 10) }

      it "must move robot to new position" do
        robot.teleport(new_position)
        robot.position.must_equal new_position
      end

      it "must keep same direction" do
        robot.teleport(new_position)
        robot.direction.must_equal old_direction
      end
    end

    context "invalid new position" do
      let(:new_position) { Position.new(500, 500) }

      it "must keep same position" do
        robot.teleport(new_position)
        robot.position.must_equal old_position
      end
    end
  end

  describe "to_s" do
    let(:robot) do
      Robot.new(Position.new(7,10), :west)
    end
    it "must return position and direction" do
      robot.to_s.must_equal "7 10 W"
    end
  end
end
