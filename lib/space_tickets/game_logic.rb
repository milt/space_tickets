module SpaceTickets
  class GameLogic
    def initialize(player,map,ui)
      @player = player
      @map = map
      @ui = ui
    end

    def run
      #handle player getting to sector edge:
      unless @player.check_edge.nil?
        if @map.shift(@player.check_edge).nil?
          @player.bounce
        else
          @player.set_sector(@map.current_sector)
          @ui.set_sector(@map.current_sector)
        end
      end

      #handle collisions:
      # unless @player.hit_box.collisions.empty?
      #   @player.bounce
      #   @player.hit_box.collisions = []
      # end
    end

    private



  end
end