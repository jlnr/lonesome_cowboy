class Thief < Gunman
  include AI
  
  def possible_directions
    FOUR_DIRECTIONS
  end
  
  def speed
    6
  end
  
  def hostile? other
    other.is_a? Player
  end
end
