module SpaceTickets
  class HitBox
    attr_reader :x_range, :y_range, :x1, :y1, :x2, :y2
    def initialize(window,image,x,y)
      x1 = x
      y1 = y
      x2 = x+image.width
      y2 = y+image.height
      coords_to_ranges(x1,y1,x2,y2)

      @hit_box_debug = HitBoxDebug.new(window,self)
    end

    def update(x1,y1,x2,y2)
      coords_to_ranges(x1,y1,x2,y2)
    end

    def draw
      @hit_box_debug.draw
    end

    private

    def coords_to_ranges(x1,y1,x2,y2)
      @x1 = x1.to_i
      @y1 = y1.to_i
      @x2 = x2.to_i
      @y2 = y2.to_i

      #args = method(__method__).parameters.map { |arg| arg[1] }

      @x_range = @x1..@x2
      @y_range = @y1..@y2
    end
  end
end