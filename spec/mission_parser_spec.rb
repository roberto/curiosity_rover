require_relative 'spec_helper'
require_relative '../lib/mission_parser'

describe MissionParser do
  describe "run" do
    context "receive boundaries" do
      it "must setup x boundary" do
        MissionParser.new("10 20\n").run
        Position.boundary.must_equal Position.new(10,20)
      end
    end

    context "receive robot coordinates" do
      before do
        @parser = MissionParser.new("10 20\n5 15 S\n")
        @parser.run
      end
      it "must setup robot position" do
        @parser.robot.position.must_equal Position.new(5, 15)
      end

      it "must setup robot direction" do
        @parser.robot.direction.must_equal :south
      end
    end

    context "input with instructions" do
      before do
        @parser = MissionParser.new("10 10\n2 5 N\nLLRRMMMRLRMMM")
      end
      it "must return robot at 5 8 E" do
        @parser.run.to_s.must_equal "5 8 E"
      end
    end

    context "input with teleport" do
      before do
        @parser = MissionParser.new("10 10\n10 1 S\nT 2 5")
      end
      it "must robot at 2 5 S" do
        @parser.run.to_s.must_equal "2 5 S"
      end
    end

    context "input with teleport and instructions" do
      before do
        @parser = MissionParser.new("10 10\n2 5 N\nLLRRMMMRLRMMM\nT 1 3\nLLRRMMRMMRM")
      end

      it "must robot at 2 1 W" do
        @parser.run.to_s.must_equal "2 1 W"
      end
    end
  end
end
