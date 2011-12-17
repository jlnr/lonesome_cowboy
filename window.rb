class Window < Gosu::Window
  def initialize
    super WIDTH, HEIGHT
  end
  
  def needs_cursor?
    true
  end
  
  def draw
    Controller.root.draw
  end
  
  def update
    self.caption = "Lonesome Cowboy @ #{Gosu::fps} FPS, Ludum Dare #22 entry by Julian Raschke"
    Controller.root.update
  end
  
  def button_down id
    Controller.root.button_down id
  end
end
