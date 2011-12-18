class Player < Gunman
  include PlayerHints
  
  def possible_directions
    FOUR_DIRECTIONS
  end
  
  def speed
    5
  end
  
  def hostile? other
    not other.is_a? Player
  end
end
