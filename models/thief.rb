class Thief < Actor
  def make_turn
    try_move rand(4)
  end
  
  def speed
    7
  end
end
