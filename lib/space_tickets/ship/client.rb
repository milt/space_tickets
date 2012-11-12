module SpaceTickets
  class Client < Ship
    def initialize(window,sector)
      @image = Gosu::Image.new(window, "media/client.png", false)
      @vel_rot = 0.0
      @sector = sector
      super window, sector
    end

    def turn(rot,vel)
      @angle = rot
      @vel_rot = vel
    end

    def drift
      @angle += @vel_rot
    end
  end
end