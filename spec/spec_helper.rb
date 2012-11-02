require 'minitest/autorun'
require_relative 'support/must_turn_helper'

module MiniTest
  class Spec
    include MustTurnHelper

    class << self
      alias_method :context, :describe
    end
  end
end
