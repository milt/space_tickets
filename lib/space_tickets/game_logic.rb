module SpaceTickets
  class GameLogic
    def initialize(player,map,ui)
      @player = player
      @map = map
      @ui = ui
    end

    def run
      #handle player getting to sector edge:
      unless @player.shifted.nil?
        shift = @map.shift(@player.shifted)
        if shift.nil?
          @player.bounce
        end
        @player.set_sector(@map.current_sector)
        @ui.set_sector(@map.current_sector)
      end

      #handle collisions:
      unless @player.hit_box.collisions.empty?
        @player.bounce
        @player.hit_box.collisions = []
      end
    end

  end
end