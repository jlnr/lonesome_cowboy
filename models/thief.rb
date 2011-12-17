class Thief < Actor
  def make_turn
    try_move rand(4)
  end
  
  def speed
    7
  end
  
  def hostile? other
    other.is_a? Player
  end
end
