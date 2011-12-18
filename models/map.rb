class Map
  def initialize
    @image = Gosu::Image.new 'media/map.jpg', :tileable => true
  end
  
  def draw
    @image.draw 0, 0, Z_MAP, 1, 1, 0x80_ffffff
    (0...TILES_X).each do |x|
      $window.draw_line x * TILE_SIZE, 0, 0x80_ffffff, x * TILE_SIZE, HEIGHT, 0x80_ffffff
    end
    (0...TILES_Y).each do |y|
      $window.draw_line 0, y * TILE_SIZE, 0x80_ffffff, WIDTH, y * TILE_SIZE, 0x80_ffffff
    end
  end
end
