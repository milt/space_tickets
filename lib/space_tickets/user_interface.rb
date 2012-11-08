module SpaceTickets
  class UserInterface
    def initialize(window)
      @sector_font = Gosu::Font.new(window, "media/visitor1.ttf", 32)
      @sector_text = "Sector 4"
      @sector_color = Gosu::Color::YELLOW

      @hud = TexPlay::create_blank_image(window, window.width, window.height)
      @hud.paint { rect (self.width - (self.width / 4)) - 6, (self.height - (self.height / 4)) - 6,self.width - 6, self.height - 6, :color => :green }
    end

    def set_sector(sector)
      @sector_text = "Sector #{sector.id.to_s}"
    end

    def draw
      @sector_font.draw(@sector_text, 10, 10, 3, 1, 1, @sector_color, :default)
      @hud.draw(0,0,3)
    end
  end
end