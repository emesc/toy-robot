require_relative 'position'

class Robot
  attr_accessor :x, :y, :f

  def initialize(position)
    @position = position
    @x = position.x || 0 
    @y = position.y || 0
    @f = position.f || 'north'
  end

  def move
    self.send("go_#{f}".to_sym)
  end

  private

    def within_board_height?(y)
      @position.valid_in_y?(y)
    end

    def within_board_width?(x)
      @position.valid_in_x?(x)
    end

    def go_north
      next_y = @y + 1
      @y = next_y if within_board_height?(next_y)
    end

    def go_south
      next_y = @y - 1
      @y = next_y if within_board_height?(next_y)
    end

    def go_east
      next_x = @x + 1
      @x = next_x if within_board_width?(next_x)
    end

    def go_west
      next_x = @x - 1
      @x = next_x if within_board_width?(next_x)
    end
end
