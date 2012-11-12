module SpaceTickets
  class Ship
    attr_reader :x,:y,:image
    def initialize(window)
      @x = @y = @vel_x = @vel_y = @angle = 0.0
      @hit_box = HitBox.new(window,self)
    end

    def draw
      @image.draw_rot(@x, @y, 1, @angle)
      @hit_box.draw
    end

    def warp(x,y)
      @x, @y = x, y
      @hit_box.update
    end

  end
end
