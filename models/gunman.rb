class Gunman < Actor
  def make_turn
    super
    
    reload
  end
  
  def try_move direction
    super_result = super
    if super_result then
      victim, direction = best_victim_with_direction
      @direction = direction if direction
    end
    super_result
  end
  
  def react
    return if dead? or @reloading
    
    victim, direction = best_victim_with_direction
    
    if victim then
      self.mark_as_killer
      victim.kill!
      shoot_at direction
    end
  end
  
  def dangerous_for? other
    victims_with_directions.map(&:first).include? other
  end
  
  protected
  
  # @return [[victim1, direction1], .. [victimN, directionN]]
  def victims_with_directions
    possible_results = []
    
    # Look in the current direction first, makes the game more realistic
    [@direction, *possible_directions].each do |direction|
      dx, dy = *direction.direction_to_deltas
      target_x, target_y = tile_x + dx, tile_y + dy
      while game.can_move? target_x, target_y do
        target_x += dx
        target_y += dy
      end
      if obj = game.object_at(target_x, target_y) and obj.hostile?(self) then
        possible_results << [obj, direction]
      end
    end
    
    possible_results
  end
  
  private
    
  def best_victim_with_direction
    victims = victims_with_directions
    first_dangerous_victim = victims.find { |v, d| v.dangerous_for? self }
    first_dangerous_victim || victims.first || [nil, nil]
  end
  
  def shoot_at direction
    @direction = direction
    dx, dy = *direction.direction_to_deltas
    @display_x += dx * TILE_SIZE / 2
    @display_y += dy * TILE_SIZE / 2
    @reloading = true
  end
  
  def reload
    @reloading = false
  end
end
