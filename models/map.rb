class Map
  def initialize
    @image = Gosu::Image.new 'media/map.jpg', :tileable => true
  end
  
  def draw
    @image.draw 0, 0, Z_MAP, 1, 1, 0x66_ffffff
    
    draw_grid
  end
  
  private
  
  def draw_grid
    color = 0x33_ffffff
    
    (0...TILES_X).each do |x|
      $window.draw_line x * TILE_SIZE, 0, color, x * TILE_SIZE, HEIGHT, color, Z_HINTS
    end
    (0...TILES_Y).each do |y|
      $window.draw_line 0, y * TILE_SIZE, color, WIDTH, y * TILE_SIZE, color, Z_HINTS
    end
  end  
end
