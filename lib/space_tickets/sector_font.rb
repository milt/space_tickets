module SpaceTickets
  class SectorFont < Gosu::Font
    attr_accessor :text
    def initialize(window)
      super window, "media/visitor1.ttf", 32
      @text = 'Sector 4'
      @color = Gosu::Color::YELLOW
    end

    def display
      self.draw(@text, 10, 10, 3, 1, 1, @color, :default)
    end

  end
end
