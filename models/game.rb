# The game class largely mediates the following interaction:
# - The current object makes its turn, either by player interaction or AI.
# - The current object reacts, then the next, then the next ...
# - The object list is rotated left by one object.
# The trick is to do all this asynchronously.
class Game
  attr_reader :objects, :player
  
  def won?
    not objects.find { |obj| player.hostile? obj and not obj.dead? }
  end
  
  def lost?
    @player.dead?
  end
  
  def initialize
    @map = Map.new
    @objects = []
    @player = Player.new(self, 4, 4, rand(4) * 2)
    @objects << @player
    @objects << Thief.new(self, 0, 0, rand(4) * 2)
    @objects << Thief.new(self, 0, TILES_Y-1, rand(4) * 2)
    @objects << Thief.new(self, TILES_X-1, 0, rand(4) * 2)
    @objects << Thief.new(self, TILES_X-1, TILES_Y-1, rand(4) * 2)
    5.times do
      x, y = rand(TILES_X), rand(TILES_Y)
      @objects << Rock.new(self, x, y) unless object_at x, y
      x, y = rand(TILES_X), rand(TILES_Y)
      @objects << Rock.new(self, x, y) unless object_at x, y
      x, y = rand(TILES_X), rand(TILES_Y)
      @objects << Rock.new(self, x, y) unless object_at x, y
      x, y = rand(TILES_X), rand(TILES_Y)
      @objects << Coyote.new(self, x, y, rand(8)) unless object_at x, y
    end
    @reaction_pending = nil
  end
  
  def draw
    @map.draw
    @objects.each &:draw
  end
  
  def update
    assert { not objects.empty? }
    
    if Gosu::button_down? Gosu::KbF12 then
      require 'pry'
      binding.pry
    end
    
    @objects.each &:animate
    
    while not busy? do
      while @reaction_pending do
        return if busy?
        @reaction_pending.react
        index = @objects.index(@reaction_pending)
        @reaction_pending = @objects[index + 1]
        # We have reached the end of the object list, each has had a chance
        # to react. Now we can rotate by one step.
        rotate_objects if @reaction_pending.nil?
      end
      
      # Wait for user input
      return if @objects.first.is_a? Player or busy?
      
      @objects.first.make_turn
      @reaction_pending = @objects.first
    end
  end
  
  def busy?
    @objects.any? &:animating?
  end
  
  def try_move_player direction
    assert { not busy? }
    assert { objects.first == player }
    
    if direction.nil? or @player.try_move direction then
      @player.make_turn
      @reaction_pending = @player
    end
  end
  
  def object_at tile_x, tile_y
    @objects.find do |obj|
      obj.tile_x == tile_x and obj.tile_y == tile_y and not obj.dead?
    end
  end
  
  def can_move? tile_x, tile_y
    (0...TILES_X).include? tile_x and (0...TILES_Y).include? tile_y and
      not object_at(tile_x, tile_y)
  end
  
  private
  
  def rotate_objects
    assert { not @objects.empty? }
    assert { not @reaction_pending }
    
    @objects << @objects.shift
  end
end
