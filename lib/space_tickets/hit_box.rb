module SpaceTickets
  class HitBox
    attr_reader :x_range, :y_range, :x1, :y1, :x2, :y2, :sector, :ship
    attr_accessor :collisions
    @@boxes = Hash.new

    def initialize(window,ship)
      @ship = ship
      coords_to_ranges(@ship)

      @hit_box_debug = HitBoxDebug.new(window,self)
      add_to_sector_hash
      @collisions = []
    end

    def update
      coords_to_ranges(@ship)
    end

    def draw
      @hit_box_debug.draw
    end

    def collides_with?(hit_box)
      if ((self.x1 <= hit_box.x2) and (hit_box.x1 <= self.x2)) && ((self.y1 <= hit_box.y2) and (hit_box.y1 <= self.y2))
        return true
      else
        return false
      end
    end

    def check_for_collision
      check = (@@boxes[@sector] - [self]).detect {|box| self.collides_with?(box)}
      unless check.nil?
        @collisions << Collision.new(self,check)
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

    def add_to_sector_hash
      unless @@boxes[@sector].nil?
        @@boxes[@sector] << self
      else
        @@boxes[@sector] = [self]
      end
    end
  end
end