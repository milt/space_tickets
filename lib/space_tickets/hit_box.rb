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

      @x1 = object.x.to_i
      @y1 = object.y.to_i
      @x2 = object.x+object.image.width.to_i
      @y2 = object.y+object.image.height.to_i

      # @x1 = x1.to_i
      # @y1 = y1.to_i
      # @x2 = x2.to_i
      # @y2 = y2.to_i

      #args = method(__method__).parameters.map { |arg| arg[1] }

      @x_range = @x1..@x2
      @y_range = @y1..@y2
    end
  end
end