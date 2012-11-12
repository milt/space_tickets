module SpaceTickets
  class HitBoxDebug < Gosu::Image
    def initialize(window,hit_box)
      super window, TexPlay::EmptyImageStub.new(hit_box.x_range.count,hit_box.y_range.count), true
      @hit_box = hit_box
      paint_box
    end

    def draw
      super @hit_box.x1, @hit_box.y1, 3
    end

    private

    def paint_box
      self.clear
      self.paint { rect 1,
                        1,
                        self.width - 1,
                        self.height - 1,
                        :color => :red
                  }
    end
  end
end
