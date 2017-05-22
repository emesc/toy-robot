require_relative 'board'

class Position
  attr_accessor :x, :y, :f

  def initialize(x: 0, y: 0, f: 'east')
    @x = x
    @y = y
    @f = f
  end

  def valid_in_x?(x)
    (0..Board.width).include? x
  end

  def valid_in_y?(y)
    (0..Board.height).include? y
  end

  # def move
  #   current_x = x
  #   current_x += 1

  # end
end
