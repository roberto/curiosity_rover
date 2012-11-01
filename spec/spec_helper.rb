require 'minitest/autorun'
require_relative 'support/factories'

module MiniTest
  class Spec
    include Factories
    class << self
      alias_method :context, :describe
    end
  end
end
