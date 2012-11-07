# space_tickets.rb

require 'gosu'

module ZOrder
  Background, Sprites, Player, UI = *0..3
end

class Player
  def initialize(window)
    @image = Gosu::Image.new(window, "media/client.png", false)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
  end

  def warp(x, y)
    @x, @y = x, y
  end
  
  def turn_left
    @angle -= 4.5
  end
  
  def turn_right
    @angle += 4.5
  end
  
  def accelerate
    @vel_x += Gosu::offset_x(@angle, 0.5)
    @vel_y += Gosu::offset_y(@angle, 0.5)
  end
  
  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 800
    @y %= 600
    
    @vel_x *= 0.95
    @vel_y *= 0.95
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle, 0.5, 0.5, 3, 3)
  end
end

class GameWindow < Gosu::Window
  def initialize
    super 800, 600, false
    self.caption = "Space Tickets"

    @background_image = Gosu::Image.new(self, "media/bk.png", true)

    @player = Player.new(self)
    @player.warp(400, 300)
  end
  
  def update
    if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
      @player.turn_left
    end
    if button_down? Gosu::KbRight or button_down? Gosu::GpRight then
      @player.turn_right
    end
    if button_down? Gosu::KbUp or button_down? Gosu::GpButton0 then
      @player.accelerate
    end
    @player.move
  end
  
  def draw
    @player.draw
    @background_image.draw(0, 0, 0)
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end

window = GameWindow.new
window.show
