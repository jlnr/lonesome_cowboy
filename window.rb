class Window < Gosu::Window
  def initialize
    super WIDTH, HEIGHT
    self.caption = "Lonesome Cowboy, Ludum Dare #22 entry by Julian Raschke"
  end
  
  def needs_cursor?
    true
  end
  
  def draw
    Controller.root.draw
  end
  
  def update
    Controller.root.update
  end
  
  def button_down id
    Controller.root.button_down id
  end
end
