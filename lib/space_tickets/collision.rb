module SpaceTickets
  class Collision
    attr_reader :ship1, :ship2
    def initialize(box1,box2)
      @ship1 = box1.ship
      @ship2 = box2.ship
      puts "#{@ship1.class} collided with #{@ship2.class}"
    end
  end
end
