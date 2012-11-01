require_relative 'spec_helper'
require_relative '../lib/position'

describe Position do
  describe "constructor" do
    before do
      @x = 12
      @y = 15
      @position = Position.new(@x, @y)
    end

    it "must setup x" do
      @position.x.must_equal @x
    end

    it "must setup x" do
      @position.y.must_equal @y
    end
  end
end
