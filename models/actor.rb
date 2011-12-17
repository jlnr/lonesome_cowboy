class Actor
  attr_reader :game
  attr_reader :tile_x, :tile_y
  attr_reader :display_x, :display_y
  
  def initialize(game, tile_x, tile_y)
    @game = game
    @tile_x, @tile_y = tile_x, tile_y
    @display_x, @display_y = target_display_x, target_display_y
  end
  
  def target_display_x
    tile_x * TILE_SIZE + TILE_SIZE / 2
  end
  
  def target_display_y
    tile_y * TILE_SIZE + TILE_SIZE / 2
  end
  
  def animating?
    display_x != target_display_x or display_y != target_display_y
  end
  
  def animate
    if @display_x < target_display_x then
      @display_x = (@display_x + speed).clamp(0..target_display_x)
    elsif @display_x > target_display_x then
      @display_x = (@display_x - speed).clamp(target_display_x...WIDTH)
    end
    if @display_y < target_display_y then
      @display_y = (@display_y + speed).clamp(0..target_display_y)
    elsif @display_y > target_display_y then
      @display_y = (@display_y - speed).clamp(target_display_y...WIDTH)
    end
  end
  
  def try_move dx, dy
    assert { not animating? }
    
    @tile_x = (@tile_x + dx).clamp(0...TILES_X)
    @tile_y = (@tile_y + dy).clamp(0...TILES_Y)
  end
end
