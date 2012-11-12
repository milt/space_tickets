module SpaceTickets
  class HitBox
    attr_reader :x_range, :y_range, :x1, :y1, :x2, :y2
    def initialize(window,object)
      @object = object
      coords_to_ranges(@object)

      @hit_box_debug = HitBoxDebug.new(window,self)
    end

    def update
      coords_to_ranges(@object)
    end

    def draw
      @hit_box_debug.draw
    end

    private

    def coords_to_ranges(object)
      # we want a square hitbox with sides equal to the longest side of the object
      size = [object.image.width,object.image.height].max.to_i

      # we offset the origin coords by 1/2 size because images are drawn around the center point
      @x1 = object.x.to_i - (size/2)
      @y1 = object.y.to_i - (size/2)
      @x2 = @x1 + size
      @y2 = @y1 + size

      @x_range = @x1..@x2
      @y_range = @y1..@y2
    end
  end
end