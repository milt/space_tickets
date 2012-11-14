module SpaceTickets
  class UserInterface
    attr_accessor :sector
    def initialize(window, start_sector)
      @sector = start_sector
      @sector_font = SectorFont.new(window)
      @hud = HUD.new(window, @sector)
    end

    def update
      @sector_font.text = "Sector #{@sector.id.to_s}"
      @hud.sector = @sector
      @hud.update
    end

    def draw
      @sector_font.display
      @hud.draw(0,0,3)
    end
  end
end