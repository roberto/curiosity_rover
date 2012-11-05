module MustTurnHelper

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def must_turn_right(*args)
      must_turn(*args) do |robot|
        robot.turn_right
      end
    end

    def must_turn_left(*args)
      must_turn(*args) do |robot|
        robot.turn_left
      end
    end

    def must_turn(params = { from: nil, to: nil }, &block)
      context "pointing #{params[:from]}" do
        let(:old_position) { Position.new(1,1) }
        let(:robot) do
          Robot.new(old_position, params[:from])
        end
        before do
          block.call(robot)
        end

        it "must change direction to #{params[:to]}" do
          robot.direction.must_equal params[:to]
        end

        it "must not change position" do
          robot.position.must_equal old_position
        end
      end
    end
  end
end
