class Player < Gunman
  def draw
    super
    
    draw_possible_moves unless dead? or animating?
  end
  
  def speed
    5
  end
  
  def hostile? other
    true
  end
end
