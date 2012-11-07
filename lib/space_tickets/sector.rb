module SpaceTickets
  class Sector
    attr_reader :x_coord, :y_coord, :id, :client_factory
    def initialize(window, x_coord, y_coord, id)
      @x_coord = x_coord
      @y_coord = y_coord
      @id = id
      @client_factory = ClientFactory.new(window, self)
    end

    def update
      @client_factory.drift
    end

    def draw
      @client_factory.draw
    end
  end
end
