module SpaceTickets
  class Player
    attr_accessor :moved
    def initialize(window)
      @image = Gosu::Image.new(window, "media/player.png", false)
      @x = @y = @vel_x = @vel_y = @angle = 0.0
      @x_clamp = window.width
      @y_clamp = window.height
      @moved = nil
      @bouncing = false
    end

    def warp(x, y)
      @x, @y = x, y
    end
    
    def turn_left
      @angle -= 4.5
    end
    
    def turn_right
      @angle += 4.5
    end
    
    def accelerate
      @vel_x += Gosu::offset_x(@angle, 0.5)
      @vel_y += Gosu::offset_y(@angle, 0.5)
    end
    
    def move
      @x += @vel_x
      @y += @vel_y

      if @bouncing == false
        @moved = case
        when @x > @x_clamp
          :right
        when @x < 0
          :left
        when @y > @y_clamp
          :down
        when @y < 0
          :up
        else
          nil
        end
      else
        @moved = nil
        @bouncing = false
      end
      
      @x %= @x_clamp
      @y %= @y_clamp

      
      @vel_x *= 0.95
      @vel_y *= 0.95
    end

    def bounce
      @vel_x = (0 - @vel_x)*2
      @vel_y = (0 - @vel_y)*2
      @bouncing = true
    end

    def draw
      @image.draw_rot(@x, @y, 1, @angle)
    end
  end
end