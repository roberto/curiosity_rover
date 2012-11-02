require_relative 'spec_helper'
require_relative '../lib/position'

describe Position do
  describe "constructor" do
    context "args as numbers" do
      before do
        @x, @y = 12, 15
        @position = Position.new(@x, @y)
      end

      it "must setup x" do
        @position.x.must_equal @x
      end

      it "must setup x" do
        @position.y.must_equal @y
      end
    end

    context "args as String" do
      before do
        @x, @y = "11", "31"
        @position = Position.new(@x, @y)
      end

      it "must convert x to integer" do
        @position.x.must_equal 11
      end

      it "must convert y to integer" do
        @position.y.must_equal 31
      end
    end
  end

  describe "==" do
    context "same x and y" do
      it "must return true" do
        Position.new(15,15).must_equal Position.new(15,15)
      end
    end

    context "diff x" do
      it "must return false" do
        Position.new(15,15).wont_equal Position.new(0,15)
      end
    end

    context "diff y" do
      it "must return false" do
        Position.new(15,15).wont_equal Position.new(15,0)
      end
    end
  end

  describe "move_to(direction)" do
    before do
      @position = Position.new(10, 10)
    end

    context "direction is north" do
      it "must increment y" do
        @position.move_to(:north)
        @position.must_equal Position.new(10,11)
      end
    end

    context "direction is south" do
      it "must decrement y" do
        @position.move_to(:south)
        @position.must_equal Position.new(10,9)
      end
    end

    context "direction is east" do
      it "must increment x" do
        @position.move_to(:east)
        @position.must_equal Position.new(11,10)
      end
    end

    context "direction is west" do
      it "must decrement x" do
        @position.move_to(:west)
        @position.must_equal Position.new(9,10)
      end
    end

  end

  describe "to_s" do
    before do
      @position = Position.new(3,5)
    end

    it "must return x and y" do
      @position.to_s.must_equal "3 5"
    end
  end
end
