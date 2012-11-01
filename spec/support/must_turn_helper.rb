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

    def must_turn(params = {from: nil, to: nil}, &block)
      context "pointing #{params[:from]}" do
        before do
          @robot = create_robot(direction: params[:from])
          @old_position = @robot.position
          block.call(@robot)
        end

        it "must change direction to #{params[:to]}" do
          @robot.direction.must_equal params[:to]
        end

        it "must not change position" do
          @robot.position.must_equal @old_position
        end
      end
    end
  end
end
