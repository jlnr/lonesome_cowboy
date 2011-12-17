class GameController < Controller
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
  
  def initialize
    @actors = []
    
  end
  
  def update
    
  end
  
  def draw
  end
end
