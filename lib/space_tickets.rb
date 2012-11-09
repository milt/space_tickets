# space_tickets.rb
module SpaceTickets
  require 'gosu'
  require 'texplay'
  require 'yaml'
  $LOAD_PATH.unshift(File.dirname(__FILE__))
  Dir["./lib/space_tickets/*"].each {|file| require file }
  class SpaceTicketsGame
    def initialize
      window = GameWindow.new
      window.show
    end
  end
end
