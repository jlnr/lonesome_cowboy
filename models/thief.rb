class Thief < Gunman
  def make_turn
    to_try = []
    
    if game.player.tile_y < tile_y then
      to_try << DIR_UP
    elsif game.player.tile_y > tile_y then
      to_try << DIR_DOWN
    end
    if game.player.tile_x < tile_x then
      to_try << DIR_LEFT
      to_try << DIR_UP_LEFT if to_try.include? DIR_UP
      to_try << DIR_DOWN_LEFT if to_try.include? DIR_DOWN
    elsif game.player.tile_x > tile_x then
      to_try << DIR_RIGHT
      to_try << DIR_UP_RIGHTP if to_try.include? DIR_UP
      to_try << DIR_DOWN_RIGHT if to_try.include? DIR_DOWN
    end
    
    to_try.reverse.find { |direction| try_move direction }
  end
  
  def speed
    6
  end
  
  def hostile? other
    other.is_a? Player
  end
end
