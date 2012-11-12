module SpaceTickets
  class HitBox
    def initialize(x1,y1,x2,y2)
      coords_to_ranges(x1,y1,x2,y2)
    end

    def update(x1,y1,x2,y2)
      coords_to_ranges(x1,y1,x2,y2)
    end

    private

    def coords_to_ranges(x1,y1,x2,y2)
      @x_range = x1..x2
      @y_range = y1..y2
    end
  end
end