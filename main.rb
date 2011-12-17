require 'rubygems'
require 'bundler/setup'
Bundler.require

WIDTH, HEIGHT = 800, 600

%w(state game_state).each do |file|
  require "./#{file}"
end

class Window < Gosu::Window
  def initialize
    super WIDTH, HEIGHT
    self.caption = "Lonesome Cowboy, Ludum Dare #22 entry by Julian Raschke"
    
    State.current = State.new
  end
  
  def needs_cursor?
    true
  end
  
  def draw
    State.current.draw
  end
  
  def update
    State.current.update
  end
  
  def button_down id
    State.current.button_down id
  end
  
  def button_up id
    State.current.button_up id
  end
end

Window.new.show
