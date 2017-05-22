require_relative 'position'

class Robot
  attr_accessor :x, :y, :f

  def initialize(position)
    @x = position.x || 0 
    @y = position.y || 0
    @f = position.f || 'north'
  end

  def move
    self.send("go_#{f}".to_sym)
  end

  private

    def go_north
      @y += 1
    end

    def go_south
      @y -= 1
    end

    def go_east
      @x += 1
    end

    def go_west
      @x -= 1
    end
end
