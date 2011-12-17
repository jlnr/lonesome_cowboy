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
    @actors.each &:update_animation
  end
  
  def move_player_if_not_animating dx, dy
    
  end
end
