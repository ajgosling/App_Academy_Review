require "colorize"
class Tile
  attr_reader :value, :given
  def initialize(value, given=false)
    @value = value
    @given = given
  end

  def value=(new_val)
    @value = new_val unless @given
    @value
  end

  def colorized_value
    if value == "0"
      return " "
    end

    @given ? @value.light_white : @value.light_green
  end

  def to_s
    colorized_value
  end

  def inspect
    colorized_value
  end
end