module SpaceTickets
  class HitBox
    attr_reader :x_range, :y_range, :x1, :y1, :x2, :y2, :sector, :ship
    @@boxes = []

    def self.boxes
      @@boxes
    end

    def initialize(window,ship)
      @ship = ship
      coords_to_ranges(@ship)

      @hit_box_debug = HitBoxDebug.new(window,self)
      @@boxes << self
    end

    def update
      coords_to_ranges(@ship)
    end

    def draw
      @hit_box_debug.draw
    end

    def check_for_collisions
      collisions = (@@boxes - [self]).select {|box| (box.sector == self.sector) && ((self.x1 <= box.x2) and (box.x1 <= self.x2)) && ((self.y1 <= box.y2) and (box.y1 <= self.y2))}
      unless collisions.empty?
        collisions.each do |box|
          collision = Collision.new(self,box)
        end
      end
    end

    private

    def coords_to_ranges(ship)
      # we want a square hitbox with sides equal to the longest side of the ship
      size = [ship.image.width,ship.image.height].max.to_i

      # we offset the origin coords by 1/2 size because images are drawn around the center point
      @x1 = ship.x.to_i - (size/2)
      @y1 = ship.y.to_i - (size/2)
      @x2 = @x1 + size
      @y2 = @y1 + size

      @x_range = @x1..@x2
      @y_range = @y1..@y2
      @sector = ship.sector
    end
  end
end