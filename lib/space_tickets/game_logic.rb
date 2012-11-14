module SpaceTickets
  class GameLogic
    def initialize(player,map,ui)
      @player = player
      @map = map
      @ui = ui
    end

    def run
      #handle player getting to sector edge:
      switch_sectors

      #update hit boxes and check for collisions
      update_and_check_hit_boxes
    end

    private

    def switch_sectors
      unless @player.check_edge.nil?
        shift = @map.shift(@player.check_edge)
        if shift.nil?
          @player.bounce
        else
          @player.set_sector(@map.current_sector)
          @ui.set_sector(@map.current_sector)
        end
      end
    end

    def update_and_check_hit_boxes
      @player.hit_box.update
      @player.hit_box.check_for_collision
    end
    
  end
end