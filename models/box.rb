class Box < GameObject
  def initialize *args
    super
    @angle = rand(4) * 90 + Gosu::random(-3, 3)
  end
  
  def draw
    @images.first.draw_rot TILE_SIZE * (tile_x + 0.5), TILE_SIZE * (tile_y + 0.5),
      Z_OBJECTS, @angle
  end
end
