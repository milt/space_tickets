module SpaceTickets
  class Player < Ship
    def initialize(window,sector)
      @image = Gosu::Image.new(window, "media/player.png", false)
      @x_clamp = window.width
      @y_clamp = window.height
      @shifted = nil
      @bouncing = false
      super window,sector
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
    
    def check_edge
      case
      when @x + @vel_x >= @x_clamp
        :right
      when @x + @vel_x <= 0
        :left
      when @y + @vel_y >= @y_clamp
        :down
      when @y + @vel_y <= 0
        :up
      else
        nil
      end
    end

    def move
        @x += @vel_x
        @y += @vel_y
        
        @x %= @x_clamp
        @y %= @y_clamp
        
        @vel_x *= 0.95
        @vel_y *= 0.95
    end

    def bounce
      @vel_x = (0 - @vel_x)*2
      @vel_y = (0 - @vel_y)*2
    end

    private

  end
end
