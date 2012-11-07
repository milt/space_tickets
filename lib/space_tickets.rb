# space_tickets.rb
module SpaceTickets
  require 'gosu'
  require_relative './space_tickets/player'
  require_relative './space_tickets/game_window'
  require_relative './space_tickets/client'
  require_relative './space_tickets/client_factory'
  class SpaceTicketsGame
    def initialize
      window = GameWindow.new
      window.show
    end
  end
end
