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
    self * 90
  end
  
  def direction_to_deltas
    case self
    when DIR_LEFT  then [-1, 0]
    when DIR_RIGHT then [+1, 0]
    when DIR_UP    then [0, -1]
    when DIR_DOWN  then [0, +1]
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
