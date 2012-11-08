module SpaceTickets
  class GameWindow < Gosu::Window
    def initialize
      prefs = Preferences.new
      super prefs.window_x, prefs.window_y, false
      self.caption = "Space Tickets"

      @map = Map.new(self)

      @background_image = Gosu::Image.new(self, "media/bk.png", true)

      @player = Player.new(self)
      @player.warp(prefs.window_x/2, prefs.window_x/2)

      @ui = UserInterface.new(self)
    end
    
    def update
      if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
        @player.turn_left
      end
      if button_down? Gosu::KbRight or button_down? Gosu::GpRight then
        @player.turn_right
      end
      if button_down? Gosu::KbUp or button_down? Gosu::GpButton0 then
        @player.accelerate
      end
      @player.move

      unless @player.moved.nil?
        shift = @map.shift(@player.moved)
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

    def button_down(id)
      if id == Gosu::KbEscape
        close
      end
    end
  end
end
