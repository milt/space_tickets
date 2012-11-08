module SpaceTickets
  class Map
    attr_reader :width, :height, :sectors
    attr_accessor :current_sector

    def initialize(window)
      @width, @height = window.width*3, window.height*3

      @sectors = []
      id = 0
      x = -1
      y = -1
      3.times do
        3.times do
          sector = Sector.new(window,x,y,id)
          @sectors << sector
          id += 1
          x += 1
        end
        y +=1
        x = -1
      end

      @current_sector = @sectors.detect {|s| s.id == 4}
    end

    def warp_sector(sector)
      @current_sector = sector
    end
    
    def shift(direction)
      new_sector = case direction
      when :up
        find_sector_by_coords(@current_sector.x_coord, (@current_sector.y_coord - 1))
      when :down
        find_sector_by_coords(@current_sector.x_coord, (@current_sector.y_coord + 1))
      when :left
        find_sector_by_coords((@current_sector.x_coord - 1), @current_sector.y_coord)
      when :right
        find_sector_by_coords((@current_sector.x_coord + 1), @current_sector.y_coord)
      else
        nil
      end

      unless new_sector.nil?
        @current_sector = new_sector
        #puts "moving to sector #{@current_sector.id}"
      end
    end

    def update
      @sectors.each {|s| s.update}
    end

    def draw
      @current_sector.draw
    end
  private

    def find_sector_by_coords(x_coord,y_coord)
      sector = @sectors.detect {|s| (s.x_coord == x_coord) && (s.y_coord == y_coord)}
    end
  end
end
