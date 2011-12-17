class Player < Actor
  def initialize(*args)
    super
    
    @images = Gosu::Image.load_tiles 'media/cowboy.png', TILE_SIZE, TILE_SIZE
  end
  
  def draw
    @images.first.draw x * TILE_SIZE, y * TILE_SIZE, Z_ACTORS
  end
end
