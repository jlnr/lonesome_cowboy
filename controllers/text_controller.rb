class TextController < Controller
  GAME_WON = "<c=00ff00>YOU\nWON."
  GAME_LOST = "<c=ff0000>YOU\nLOST."
  
  def initialize(background_controller, text)
    @background_controller = background_controller
    @image = Gosu::Image.from_text(text, 100, :width => 510, :align => :center)
  end
  
  def draw
    @background_controller.draw
    Gosu::flush
    @image.draw_rot WIDTH / 2, HEIGHT / 2, 0, 0, 0.5, 0.8
  end
  
  def update
    @background_controller.update
  end
  
  def button_down id
    case id
    when Gosu::KbReturn, Gosu::KbEnter, Gosu::KbSpace, Gosu::KbEscape,
        Gosu::GpButton1 then
      Controller.root = GameController.new
    end
  end
end
