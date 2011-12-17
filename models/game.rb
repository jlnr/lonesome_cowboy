class Game
  # Logic works like that:
  # for each object do
  # - make / wait for decision
  #   view: indicate possible moves
  # - movement
  #   view: movement animation with auto-aiming
  # - shooting
  #   view: shooting animation for actor
  #         being-hit animation for victim(s)
  # end
  
  # Preliminary brainstorming for level generation
  # Start with just the player surviving
  # loop do
  # - n random reverse movement steps of each character
  # - spawn enemies where they would be shot
  # - stop if no possible move left
  # end
  
  attr_reader :map
  attr_reader :actors
  
  def initialize
    @map = Map.new
    @player = Player.new(self, 4, 4)
    @actors = [@player]
  end
  
  def draw
    @map.draw
    @actors.each &:draw
  end
  
  def update
    if $window.button_down? Gosu::KbF12 then
      require 'pry'
      binding.pry
    end
    
    @actors.each &:animate
  end
  
  def busy?
    @actors.any? &:animating?
  end
  
  def try_move_player dx, dy
    assert { not busy? }
    
    @player.try_move dx, dy
  end
end
