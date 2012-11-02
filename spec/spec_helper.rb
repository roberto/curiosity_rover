if ENV['coverage'] == 'ON'
  require 'simplecov'
  SimpleCov.start do
    add_filter "/spec/"
  end
end

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

# minitest, stub support:
# https://github.com/seattlerb/minitest/blob/master/lib/minitest/mock.rb#L130
class Object
  def stub name, val_or_callable, &block
    new_name = "__minitest_stub__#{name}"

    metaclass = class << self; self; end

    if respond_to? name and not methods.map(&:to_s).include? name.to_s then
      metaclass.send :define_method, name do |*args|
        super(*args)
      end
    end

    metaclass.send :alias_method, new_name, name

    metaclass.send :define_method, name do |*args|
      if val_or_callable.respond_to? :call then
        val_or_callable.call(*args)
      else
        val_or_callable
      end
    end

    yield self
  ensure
    metaclass.send :undef_method, name
    metaclass.send :alias_method, name, new_name
    metaclass.send :undef_method, new_name
  end
end
