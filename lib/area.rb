require 'singleton'

class Area
  include Singleton
  attr_accessor :width, :height

  def setup(width, height)
    @width, @height = width.to_i, height.to_i
    self
  end

  def inside?(position)
    (0..width).include?(position.x) && (0..height).include?(position.y)
  end

end
