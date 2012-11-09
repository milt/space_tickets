module SpaceTickets
  class HUD < Gosu::Image
    def initialize(window)
      super window, TexPlay::EmptyImageStub.new(window.width,window.height), true
      paint_border
    end

    def update
    end

  private
    def paint_border
      self.paint { rect (self.width - (self.width / 4)) - 6,
                        (self.height - (self.height / 4)) - 6,
                        self.width - 6, self.height - 6,
                        :color => :green
                        }
    end
  end
end
