class Rock < GameObject
  def initialize *args
    super
    @angle = Gosu::random(0, 360)
  end
  
  def draw
    display_x = TILE_SIZE * (tile_x + 0.5)
    display_y = TILE_SIZE * (tile_y + 0.5)
    @images.first.draw_rot display_x + 4, display_y + 19, Z_SHADOWS, @angle,
      0.5, 0.5, 0.9, 0.9, 0x80_000000
    @images.first.draw_rot display_x, display_y, Z_OBJECTS, @angle,
      0.5, 0.5, 0.9, 0.9
  end
end
