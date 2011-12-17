class GameController < Controller
  INPUT_QUEUE_SIZE = 2
  
  def initialize
    @game = Game.new
    @queue = []
  end
  
  def update
    @game.update
    
    if not @game.busy? and not @queue.empty? then
      @game.try_move_player(*@queue.shift)
    end
  end
  
  def draw
    @game.draw
  end
  
  def button_down id
    return if @queue.size == INPUT_QUEUE_SIZE
    
    vector = case id
    when Gosu::KbLeft, Gosu::GpLeft then
      [-1, 0]
    when Gosu::KbRight, Gosu::GpRight then
      [+1, 0]
    when Gosu::KbUp, Gosu::GpUp then
      [0, -1]
    when Gosu::KbDown, Gosu::GpDown then
      [0, +1]
    else
      return
    end
    @queue << vector
  end
end
