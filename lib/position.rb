class Position
  attr_accessor :x, :y, :f

  def initialize(x: 0, y: 0, f: 'east')
    @x = x
    @y = y
    @f = f
  end
end
