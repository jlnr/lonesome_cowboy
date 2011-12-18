class Player < Gunman
  include PlayerHints
  
  def speed
    5
  end
  
  def hostile? other
    true
  end
end
