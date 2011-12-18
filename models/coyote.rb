class Coyote < Actor
  include AI
  
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
