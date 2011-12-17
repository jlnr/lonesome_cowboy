class Thief < Actor
  def make_turn
    try_move 0, 1
  end
  
  def speed
    7
  end
end
