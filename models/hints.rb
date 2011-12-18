module Hints
  def draw_possible_moves
    hint_color = 0x22_00ff00
    
    (0...4).each do |direction|
      dx, dy = direction.direction_to_deltas
      if game.can_move? self.tile_x + dx, self.tile_y + dy then
        Gosu::draw_rect TILE_SIZE * (tile_x + dx), TILE_SIZE * (tile_y + dy),
          TILE_SIZE, TILE_SIZE, hint_color, Z_HINTS
      end
    end
    Gosu::draw_rect TILE_SIZE * tile_x, TILE_SIZE * tile_y,
      TILE_SIZE, TILE_SIZE, hint_color, Z_HINTS
  end
end
Actor.send :include, Hints
