class Numeric
  def clamp(range)
    if self < range.min then
      range.min
    elsif self >= range.max then
      range.max
    else
      self
    end
  end
  
  def direction_to_angle
    self * 45
  end
  
  def direction_to_deltas
    case self
    when DIR_UP         then [ 0, -1]
    when DIR_UP_RIGHT   then [+1, -1]
    when DIR_RIGHT      then [+1,  0]
    when DIR_DOWN_RIGHT then [+1, +1]
    when DIR_DOWN       then [0,  +1]
    when DIR_DOWN_LEFT  then [-1, +1]
    when DIR_LEFT       then [-1,  0]
    when DIR_UP_LEFT    then [-1, -1]
    else
      assert { false }
      [0, 0]
    end
  end
end

def assert &condition
  if not condition.call then
    require 'pry'
    condition.binding.pry
  end
end

module Gosu
  def self.draw_rect x, y, w, h, color, z
    draw_quad x, y, color, x + w, y, color, x, y + h, color, x + w, y + h, color, z
  end
  
  def self.draw_line *args
    $window.draw_line *args
  end
  
  def self.draw_quad *args
    $window.draw_quad *args
  end
  
  def self.button_down? id
    $window.button_down? id
  end
  
  def self.flush
    $window.flush
  end
end
