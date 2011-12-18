module ActorHints
  def mark_as_killer
    @killer_color = Gosu::Color.argb(0x60, 0xff, 0xff, 0xff)
  end
  
  def draw
    super
    
    if @killer_color then
      Gosu::draw_rect TILE_SIZE * tile_x, TILE_SIZE * tile_y,
        TILE_SIZE, TILE_SIZE, @killer_color, Z_HINTS
    end
  end
  
  def animate
    super
    
    if @killer_color then
      @killer_color.alpha -= 2
      @killer_color = nil if @killer_color.alpha == 0
    end
  end
end

module PlayerHints
  def draw
    super
    
    return if dead? or animating? or game.objects.first != self
    
    hint_color = 0x22_00ff00
    
    FOUR_DIRECTIONS.each do |direction|
      dx, dy = direction.direction_to_deltas
      if game.can_move? self.tile_x + dx, self.tile_y + dy then
        Gosu::draw_rect TILE_SIZE * (tile_x + dx), TILE_SIZE * (tile_y + dy),
          TILE_SIZE, TILE_SIZE, hint_color, Z_HINTS
      end
    end
    Gosu::draw_rect TILE_SIZE * tile_x, TILE_SIZE * tile_y,
      TILE_SIZE, TILE_SIZE, hint_color, Z_HINTS
  end
end

module MapHints
  def draw_grid
    color = 0x33_ffffff
  
    (0...TILES_X).each do |x|
      Gosu::draw_line x * TILE_SIZE, 0, color, x * TILE_SIZE, HEIGHT, color, Z_HINTS
    end
    (0...TILES_Y).each do |y|
      Gosu::draw_line 0, y * TILE_SIZE, color, WIDTH, y * TILE_SIZE, color, Z_HINTS
    end
  end  
end
