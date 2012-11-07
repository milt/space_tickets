# space_tickets.rb
module SpaceTickets
  require 'gosu'
  require 'yaml'
  $LOAD_PATH.unshift(File.dirname(__FILE__))
  require 'space_tickets/preferences'
  require 'space_tickets/player'
  require 'space_tickets/game_window'
  require 'space_tickets/client'
  require 'space_tickets/client_factory'
  require 'space_tickets/map'
  require 'space_tickets/sector'
  class SpaceTicketsGame
    def initialize
      window = GameWindow.new
      window.show
    end
  end
end
