require_relative 'spec_helper'

describe Area do
  before do
    @area = Area.instance
  end
  it "must be singleton" do
    @area.must_be_kind_of Singleton
  end
  it "must have width" do
    @area.must_respond_to :width
  end
  it "must have height" do
    @area.must_respond_to :height
  end

  describe "setup" do
    before do
      Area.instance.setup("15",30)
    end
    it "must setup width" do
      Area.instance.width.must_equal 15
    end

    it "must setup height" do
      Area.instance.height.must_equal 30
    end
  end

  describe "inside?" do
    before do
      @area = Area.instance.setup(3,5)
    end

    context "x and y inside" do
      it "must return true" do
        @area.inside?(Position.new(2,2)).must_equal true
      end
    end

    context "x greater than width" do
      it "must return false" do
        @area.inside?(Position.new(6,5)).must_equal false
      end
    end

    context "y greater than height" do
      it "must return false" do
        @area.inside?(Position.new(0,6)).must_equal false
      end
    end

    context "negative x" do
      it "must return false" do
        @area.inside?(Position.new(-1,3)).must_equal false
      end
    end

    context "negative y" do
      it "must return false" do
        @area.inside?(Position.new(2,-2)).must_equal false
      end
    end
  end
end
