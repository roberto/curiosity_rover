require_relative 'spec_helper'

describe Position do
  describe "constructor" do
    context "args as numbers" do
      before do
        @x, @y = 12, 15
      end

      let(:position) { Position.new(@x, @y) }

      it "must setup x" do
        position.x.must_equal @x
      end

      it "must setup x" do
        position.y.must_equal @y
      end
    end

    context "args as String" do
      before do
        @x, @y = "11", "31"
      end
      let(:position) { Position.new(@x, @y) }

      it "must convert x to integer" do
        position.x.must_equal 11
      end

      it "must convert y to integer" do
        position.y.must_equal 31
      end
    end
  end

  describe "==" do
    let(:position) { Position.new(15,15) }
    context "same x and y" do
      it "must return true" do
        position.must_equal Position.new(15,15)
      end
    end

    context "diff x" do
      it "must return false" do
        position.wont_equal Position.new(0,15)
      end
    end

    context "diff y" do
      it "must return false" do
        position.wont_equal Position.new(15,0)
      end
    end
  end

  describe "move_to(direction)" do
    context "inbound" do
      before do
        Area.instance.setup(20,20)
      end
      let(:position) { Position.new(10, 10) }

      context "direction is north" do
        it "must increment y" do
          position.move_to(:north)
          position.must_equal Position.new(10,11)
        end
      end

      context "direction is south" do
        it "must decrement y" do
          position.move_to(:south)
          position.must_equal Position.new(10,9)
        end
      end

      context "direction is east" do
        it "must increment x" do
          position.move_to(:east)
          position.must_equal Position.new(11,10)
        end
      end

      context "direction is west" do
        it "must decrement x" do
          position.move_to(:west)
          position.must_equal Position.new(9,10)
        end
      end
    end

    context "outbound" do
      context "direction north" do
        before do
          Area.instance.setup(4,5)
        end

        let(:old_position){ Position.new(1,5)}
        let(:position){ old_position.dup }

        it "must maintain current position" do
          position.move_to(:north)
          position.must_equal old_position
        end
      end
    end
  end

  describe "valid?" do
    let(:area) { MiniTest::Mock.new }
    let(:position) { Position.new(1,1) }

    it "must use area to validate it" do
      area.expect :inside?, true, [position]
      Area.stub :instance, area do
        position.valid?
      end
      area.verify
    end
  end

  describe "to_s" do
    let(:position) { Position.new(3,5) }

    it "must return x and y" do
      position.to_s.must_equal "3 5"
    end
  end
end
