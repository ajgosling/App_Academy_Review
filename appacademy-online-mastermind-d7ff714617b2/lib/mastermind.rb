# require 'byebug'
class Code
  attr_reader :pegs

  PEGS = ["R", "G", "B", "Y", "O", "P"]
  def initialize
    @pegs = pegs
  end

  def self.random
    str = ""
    4.times do
      str += PEGS.sample
    end

    return Code.new(str)
  end

  def exact_matches(other)
    count = 0
    self.pegs.each_char.with_index do |c, i|
      count += 1 if c == other.pegs[i]
    end
    return count
  end

  def near_matches(other)
    count = 0
    PEGS.each do |color|
      count += [self.pegs.count(color), other.pegs.count(color)].min
    end

    return count - self.exact_matches(other)
  end
end

class Game
  attr_reader :secret_code

  def initialize(secret_code = Code.new)

  end
end
