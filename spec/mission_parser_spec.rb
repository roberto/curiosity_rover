require_relative 'spec_helper'

describe MissionParser do
  describe "run" do
    context "receive boundaries" do
      before do
        MissionParser.new("10 20\n").run
      end
      it "must setup area width" do
        Area.instance.width.must_equal 10
      end
      it "must setup area height" do
        Area.instance.height.must_equal 20
      end
    end

    context "receive robot coordinates" do
      let(:parser) { MissionParser.new("10 20\n5 15 S\n") }

      it "must setup robot position" do
        parser.run
        parser.robot.position.must_equal Position.new(5, 15)
      end

      it "must setup robot direction" do
        parser.run
        parser.robot.direction.must_equal :south
      end
    end

    context "input with instructions" do
      let(:parser) { MissionParser.new("10 10\n2 5 N\nLLRRMMMRLRMMM") }

      it "must return robot at 5 8 E" do
        parser.run.to_s.must_equal "5 8 E"
      end
    end

    context "input with teleport" do
      let(:parser) { MissionParser.new("10 10\n10 1 S\nT 2 5") }

      it "must robot at 2 5 S" do
        parser.run.to_s.must_equal "2 5 S"
      end
    end

    context "input with teleport and instructions" do
      let(:parser) { MissionParser.new("10 10\n2 5 N\nLLRRMMMRLRMMM\nT 1 3\nLLRRMMRMMRM") }

      it "must robot at 2 1 W" do
        parser.run.to_s.must_equal "2 1 W"
      end
    end
  end
end
