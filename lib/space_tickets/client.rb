module SpaceTickets
  class Client
    attr_reader :x, :y, :sector
    def initialize(window, sector)
      @image = Gosu::Image.new(window, "media/client.png", false)
      @x = @y = @vel_x = @vel_y = @angle = @vel_rot = 0.0
      @sector = sector
      @hit_box = HitBox.new(window,@image,@x,@y)
    end

    def turn(rot,vel)
      @angle = rot
      @vel_rot = vel
    end

    def drift
      @angle += @vel_rot
    end

    def warp(x, y)
      @x, @y = x, y
      @hit_box.update(@x,@y,@x+@image.width,@y+@image.height)
    end
    
    # def turn_left
    #   @angle -= 4.5
    # end
    
    # def turn_right
    #   @angle += 4.5
    # end
    
    # def accelerate
    #   @vel_x += Gosu::offset_x(@angle, 0.5)
    #   @vel_y += Gosu::offset_y(@angle, 0.5)
    # end
    
    # def move
    #   @x += @vel_x
    #   @y += @vel_y
    #   @x %= 800
    #   @y %= 600
      
    #   @vel_x *= 0.95
    #   @vel_y *= 0.95
    # end

    def draw
      @image.draw_rot(@x, @y, 1, @angle)
      @hit_box.draw
    end
  end
end