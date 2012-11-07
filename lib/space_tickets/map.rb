module SpaceTickets
  class Map
    attr_reader :width, :height, :sectors

    def initialize(window)
      @width, @height = window.width*3, window.height*3

      @sectors = []
      id = 0
      x = -1
      y = -1
      3.times do #|y=-1|
        3.times do #|x=-1|
          sector = Sector.new(window,x,y,id)
          @sectors << sector
          id += 1
          x += 1
        end
        y +=1
        x = -1
      end
    end

    def update
      @sectors.each {|s| s.update}
    end

    def draw(sector)
      sector.draw
    end
  end
end
