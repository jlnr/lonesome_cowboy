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
  
  attr_reader :objects
  
  def initialize
    @map = Map.new
    @player = Player.new(self, 4, 4)
    @objects = [@player]
    5.times do |i|
      @objects << Thief.new(self, 10 + i, 1)
    end
  end
  
  def draw
    @map.draw
    @objects.each &:draw
  end
  
  def update
    if $window.button_down? Gosu::KbF12 then
      require 'pry'
      binding.pry
    end
    
    @objects.each &:animate
  end
  
  def busy?
    @objects.any? &:animating?
  end
  
  def try_move_player dx, dy
    assert { not busy? }
    
    @player.try_move dx, dy
  end
  
  def can_move? tile_x, tile_y
    (0...TILES_X).include? tile_x and (0...TILES_Y).include? tile_y and
      not @objects.find { |obj| obj.tile_x == tile_x and obj.tile_y == tile_y }
  end
end
