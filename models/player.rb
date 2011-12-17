class Player < Actor
  def initialize(*args)
    super
    
    @images = Gosu::Image.load_tiles 'media/cowboy.png', TILE_SIZE, TILE_SIZE
  end
  
  def draw
    @images.first.draw_rot display_x + 2, display_y + 6, Z_ACTORS, @angle, 0.5, 0.5, 0.9, 0.9, 0x80_000000
    @images.first.draw_rot display_x, display_y, Z_ACTORS, @angle
  end
  
  def speed
    5
  end
end
