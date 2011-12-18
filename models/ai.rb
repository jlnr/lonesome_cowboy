module AI
  def make_turn
    to_try = []
    
    if game.player.tile_y < tile_y then
      to_try = [DIR_LEFT, DIR_RIGHT, DIR_UP]
    elsif game.player.tile_y > tile_y then
      to_try = [DIR_RIGHT, DIR_LEFT, DIR_DOWN]
    end
    if game.player.tile_x < tile_x then
      to_try << DIR_LEFT
      to_try << DIR_UP_LEFT if to_try.include? DIR_UP
      to_try << DIR_DOWN_LEFT if to_try.include? DIR_DOWN
    elsif game.player.tile_x > tile_x then
      to_try << DIR_RIGHT
      to_try << DIR_UP_RIGHT if to_try.include? DIR_UP
      to_try << DIR_DOWN_RIGHT if to_try.include? DIR_DOWN
    end
    
    to_try.reverse.find do |direction|
      possible_directions.include? direction and try_move direction
    end
  end
end
