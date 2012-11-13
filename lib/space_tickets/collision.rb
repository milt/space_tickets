module SpaceTickets
  class Collision
    attr_reader :box1, :box2
    def initialize(box1,box2)
      @box1 = box1
      @box2 = box2
    end
  end
end
