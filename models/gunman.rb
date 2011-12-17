class Gunman < Actor
  def try_move direction
    super_result = super
    if super_result then
      v, d = victim_and_direction
      @direction = d if d
    end
    super_result
  end
  
  def react
    return if dead?
    
    v, d = victim_and_direction
    v.kill! if v
  end
  
  private
  
  def victim_and_direction
    # Look in the current direction first, makes the game more realistic
    [@direction, *0..3].each do |direction|
      dx, dy = *direction.direction_to_deltas
      target_x, target_y = tile_x + dx, tile_y + dy
      while game.can_move? target_x, target_y do
        target_x += dx
        target_y += dy
      end
      if obj = game.object_at(target_x, target_y) and obj.hostile?(self) then
        return obj, direction
      end
    end
    
    return nil, nil
  end
end