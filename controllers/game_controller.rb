class GameController < Controller
  def initialize
    @game = Game.new
  end
  
  def update
    @game.update
  end
  
  def draw
    @game.draw
  end
  
  def button_down id
    direction = case id
    when Gosu::KbLeft, Gosu::GpLeft then
      [-1, 0]
    when Gosu::KbRight, Gosu::GpRight then
      [+1, 0]
    when Gosu::KbUp, Gosu::GpUp then
      [0, -1]
    when Gosu::KbDown, Gosu::GpDown then
      [0, +1]
    end
    @game.move_player_if_not_animating *vector
  end
end
