class Actor
  attr_reader :game
  attr_reader :x, :y
  
  def initialize(game, x, y)
    @game = game
    @x, @y = x, y
  end
  
  def update_animation
    
  end
end
