require_relative 'board'

class Position
  attr_accessor :x, :y, :f

  def initialize(x: 0, y: 0, f: 'east')
    @x = x
    @y = y
    @f = f
  end

  def valid_in_x?
    (0..Board.width).include? x
  end

  def valid_in_y?
    (0..Board.height).include? y
  end
end
