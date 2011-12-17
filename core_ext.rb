class Numeric
  def clamp range
    if self < range.min then
      range.min
    elsif self >= range.max then
      range.max
    else
      self
    end
  end
end

def assert &condition
  if not condition.call then
    require 'pry'
    condition.binding.pry
  end
end
