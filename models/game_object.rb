class GameObject
  attr_reader :game
  attr_reader :tile_x, :tile_y
  
  def initialize(game, tile_x, tile_y)
    assert { game.object_at(tile_x, tile_y).nil? }
    
    @game = game
    @tile_x, @tile_y = tile_x, tile_y
    @images = Gosu::Image.load_tiles "media/#{self.class.name.downcase}.png", TILE_SIZE, TILE_SIZE
  end
  
  def draw
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
  
  def hostile? other
    false
  end
  
  def dead?
    @dead
  end
  
  def kill!
    @dead = true
  end
end
