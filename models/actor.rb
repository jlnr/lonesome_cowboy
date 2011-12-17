class Actor < GameObject
  def initialize(game, x, y, direction)
    super game, x, y
    @direction = direction
    
    @display_x, @display_y = target_display_x, target_display_y
    @display_angle = target_display_angle
    
    @images = Gosu::Image.load_tiles "media/#{self.class.name.downcase}.png", TILE_SIZE, TILE_SIZE
    
    @dead = false
  end
  
  def draw
    return if @dead
    
    @images.first.draw_rot @display_x + 2, @display_y + 6, Z_ACTORS, @display_angle,
      0.5, 0.5, 0.9, 0.9, 0x80_000000
    @images.first.draw_rot @display_x, @display_y, Z_ACTORS, @display_angle
  end
  
  def target_display_x
    tile_x * TILE_SIZE + TILE_SIZE / 2
  end
  
  def target_display_y
    tile_y * TILE_SIZE + TILE_SIZE / 2
  end
  
  def target_display_angle
    @direction.direction_to_angle
  end
  
  def animating?
    return false if @dead
    
    # Not checking for the angle here. It should always change fast enough
    # as to not look weird when #react is being called.
    
    @display_x != target_display_x or @display_y != target_display_y
  end
  
  def animate
    return false if @dead
    
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
    @display_angle +=
      Gosu::angle_diff(@display_angle, target_display_angle) * 0.25
  end
  
  def try_move direction
    return false if @dead
    
    dx, dy = *direction.direction_to_deltas
    
    assert { not animating? }
    
    if game.can_move? tile_x + dx, tile_y + dy then
      @tile_x = tile_x + dx
      @tile_y = tile_y + dy
      @direction = direction
      true
    end
  end
  
  def react
    return if @dead
    
    dx, dy = *@direction.direction_to_deltas
    target_x, target_y = tile_x + dx, tile_y + dy
    while game.can_move? target_x, target_y do
      target_x += dx
      target_y += dy
    end
    if obj = game.object_at(target_x, target_y) and obj.class != self.class then
      obj.kill
    end
  end
  
  def kill
    @dead = true
  end
end
