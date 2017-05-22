class Robot
  attr_accessor :x, :y, :f

  def initialize(position)
    @x = position.x
    @y = position.y
    @f = position.f
  end
end
