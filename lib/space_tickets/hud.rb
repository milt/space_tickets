module SpaceTickets
  class HUD < Gosu::Image
    attr_accessor :sector
    def initialize(window, start_sector)
      super window, TexPlay::EmptyImageStub.new(window.width,window.height), true
      @sector = start_sector
      get_size_and_pos
      paint_border
      paint_cell(start_sector)
    end

    def update
      self.clear
      paint_border
      paint_cell(@sector)
    end

  private

    def get_size_and_pos
      width = self.width
      height = self.height
      @rect_top_left_x = (width - (width / 4)) - 6
      @rect_top_left_y = (height - (height / 4)) - 6
      @rect_bot_right_x = width - 6
      @rect_bot_right_y = height - 6

      @cell_width = (@rect_bot_right_x - @rect_top_left_x)/3
      @cell_height = (@rect_bot_right_y - @rect_top_left_y)/3

      @cell_coords = []
      id = 0

      3.times do |y|
        3.times do |x|
          @cell_coords << [@rect_top_left_x + (x * @cell_width), @rect_top_left_y + (y * @cell_height)]
          id += 1
        end
      end
    end

    def paint_border
      self.paint { rect @rect_top_left_x,
                        @rect_top_left_y,
                        @rect_bot_right_x,
                        @rect_bot_right_y,
                        :color => :green
                        }
    end

    def paint_cell(current)
      id = current.id
      self.paint { rect @cell_coords[id][0],
                        @cell_coords[id][1],
                        @cell_coords[id][0] + @cell_width,
                        @cell_coords[id][1] + @cell_height
                        }
    end
  end
end
