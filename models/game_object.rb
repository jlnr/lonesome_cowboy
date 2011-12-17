class GameObject
  attr_reader :game
  attr_reader :tile_x, :tile_y
  
  def initialize(game, tile_x, tile_y)
    @game = game
    @tile_x, @tile_y = tile_x, tile_y
  end
  
  def animating?
    false
  end
  
  def animate
  end
  
  def make_turn
  end
  
  def react
  end
end
