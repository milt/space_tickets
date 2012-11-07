module SpaceTickets
  class Preferences
    attr_accessor :media_path, :window_x, :window_y
    def initialize
      config = YAML.load_file 'config/config.yml'
      @media_path = config['paths']['media']
      @window_x = config['display']['window_x']
      @window_y = config['display']['window_y']
    end
  end
end