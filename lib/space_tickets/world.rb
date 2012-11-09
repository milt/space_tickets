module SpaceTickets
  class World
    attr_reader :player
    def initialize(window)
      @map = Map.new(window)

      @background_image = Gosu::Image.new(window, "media/bk.png", true)

      @player = Player.new(window)
      @player.warp(window.width/2, window.height/2)

      @ui = UserInterface.new(window, @map.current_sector)
    end

    def update
      @player.move

      unless @player.shifted.nil?
        shift = @map.shift(@player.shifted)
        if shift.nil?
          @player.bounce
        end
        @ui.set_sector(@map.current_sector)
      end
      
      @map.update
    end

    def draw
      @map.draw
      @player.draw
      @background_image.draw(0, 0, 0)
      @ui.draw
    end
  end
end