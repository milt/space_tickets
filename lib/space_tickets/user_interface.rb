module SpaceTickets
  class UserInterface
    def initialize(window)
      @sector_font = SectorFont.new(window)
      @hud = HUD.new(window)
    end

    def set_sector(sector)
      @sector_font.text = "Sector #{sector.id.to_s}"
    end

    def draw
      @sector_font.display
      @hud.draw(0,0,3)
    end
  end
end