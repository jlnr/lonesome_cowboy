class Map
  include MapHints
  
  def initialize
    @image = Gosu::Image.new 'media/map.jpg', :tileable => true
  end
  
  def draw
    @image.draw 0, 0, Z_MAP, 1, 1, 0x66_ffffff
    
    draw_grid
  end
end
