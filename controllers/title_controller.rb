# Encoding: UTF-8

class TitleController < Controller
  TITLE_TEXT = "<b>Lonesome ☆ Cowboy</b>\n\n" +
    "Chased by thieves and coyotes, all you want to be is alone.\n" +
    "Each turn, one character moves and automatically shoots from his new " +
    "position. Can you fight off all your predators?\n\n" +
    "Levels are randomly generated and not necessarily finishable. Sorry!\n\n" +
    "Ludum Dare 22 Entry by Julian Raschke <julian@raschke.de>"
  
  def initialize
    @background_controller = GameController.new
    @image = Gosu::Image.from_text(TITLE_TEXT, 40,
      :width => 900, :align => :center, :font => FONT_NAME)
  end
  
  def draw
    @background_controller.draw
    Gosu::flush
    Gosu::draw_rect 0, 0, WIDTH, HEIGHT, 0x80_000000, 0
    @image.draw_rot WIDTH / 2, HEIGHT / 2, 0, 0, 0.5, 0.6
  end
  
  def update
    @background_controller.update
  end
  
  def button_down id
    case id
    when Gosu::KbReturn, Gosu::KbEnter, Gosu::KbSpace, Gosu::KbEscape,
        Gosu::GpButton1 then
      Controller.root = @background_controller
    end
  end
end
