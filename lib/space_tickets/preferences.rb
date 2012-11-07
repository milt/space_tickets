module SpaceTickets
  class Preferences
    attr_accessor :media_path, :window_x, :window_y, :map_x, :map_y, :start_sector
    def initialize
      config = YAML.load_file 'config/config.yml'
      @media_path = config['paths']['media']
      @window_x = config['display']['window_x']
      @window_y = config['display']['window_y']
      @map_x = @window_x*3
      @map_y = @window_y*3
      @start_sector = config['default']['sector']
    end
  end
end