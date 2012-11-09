module SpaceTickets
  class GameWindow < Gosu::Window
    def initialize
      prefs = Preferences.new
      super prefs.window_x, prefs.window_y, false
      self.caption = "Space Tickets"

      @world = World.new(self)
    end
    
    def update
      if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
        @world.player.turn_left
      end
      if button_down? Gosu::KbRight or button_down? Gosu::GpRight then
        @world.player.turn_right
      end
      if button_down? Gosu::KbUp or button_down? Gosu::GpButton0 then
        @world.player.accelerate
      end
      @world.update
    end
    
    def draw
      @world.draw
    end

    def button_down(id)
      if id == Gosu::KbEscape
        close
      end
    end
  end
end
