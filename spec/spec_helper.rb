if ENV['coverage'] == 'ON'
  require 'simplecov'
  SimpleCov.start do
    add_filter "/spec/"
    command_name 'MiniTest'
  end
end

require 'minitest/autorun'
require_relative 'support/must_turn_helper'
require_relative '../lib/curiosity_rover'

module MiniTest
  class Spec
    include MustTurnHelper

    class << self
      alias_method :context, :describe
    end
  end
end
