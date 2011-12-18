class Coyote < Actor
  include AI
  
  def make_turn
    # First, try to attack
    possible_directions.each do |direction|
      dx, dy = direction.direction_to_deltas
      if obj = game.object_at(tile_x + dx, tile_y + dy) and hostile? obj then
        @display_x += dx * TILE_SIZE / 2
        @display_y += dy * TILE_SIZE / 2
        # Bite people!
        obj.kill!
        return
      end
    end
    
    super
  end
  
  def possible_directions
    EIGHT_DIRECTIONS
  end
  
  def hostile? other
    other.is_a? Player
  end
  
  def speed
    9
  end
end
