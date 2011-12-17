class GameController < Controller
  INPUT_QUEUE_SIZE = 1
  
  def initialize
    @game = Game.new
    @queue = []
  end
  
  def update
    @game.update
    
    if not @game.busy? and not @queue.empty? then
      @game.try_move_player @queue.shift
    end
  end
  
  def draw
    @game.draw
  end
  
  def button_down id
    return if @queue.size == INPUT_QUEUE_SIZE
    
    direction = case id
    when Gosu::KbLeft, Gosu::GpLeft then
      DIR_LEFT
    when Gosu::KbRight, Gosu::GpRight then
      DIR_RIGHT
    when Gosu::KbUp, Gosu::GpUp then
      DIR_UP
    when Gosu::KbDown, Gosu::GpDown then
      DIR_DOWN
    else
      return
    end
    @queue << direction
  end
end
