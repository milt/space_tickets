module SpaceTickets
  class ClientFactory
    def initialize(window)
      @clients = []

      10.times do
        client = Client.new(window)
        client.warp(rand(window.width),rand(window.height))
        client.turn(rand(360),rand(-1.0..1.0))
        @clients << client
      end
    end

    def drift
      @clients.each do |client|
        client.drift
      end
    end

    def draw
      @clients.each do |client|
        client.draw
      end
    end
  end
end
