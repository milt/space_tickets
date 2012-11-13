module SpaceTickets
  class World
    attr_reader :player
    def initialize(window)
      @map = Map.new(window)
      @background_image = Gosu::Image.new(window, "media/bk.png", true)
      @player = Player.new(window, @map.current_sector)
      @player.warp(window.width/2, window.height/2)
      @ui = UserInterface.new(window, @map.current_sector)
      @logic = GameLogic.new(@player,@map,@ui)
    end

    def update
      @logic.run
      @player.move
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