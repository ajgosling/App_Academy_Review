class HumanPlayer
  attr_reader :mark
  def initialize(mark)
    @mark = mark
  end

  def get_position
    p "player #{@mark}: Enter a position, e.g. `2 0`"
    input = gets.chomp.split.map(&:to_i)
    raise "invalid position" unless input.length == 2
    return input
  end
end