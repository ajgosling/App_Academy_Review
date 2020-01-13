# require 'byebug'
class Code
  attr_reader :pegs

  PEGS = ["R", "G", "B", "Y", "O", "P"]
  def initialize(pegs = Code.random)
    @pegs = pegs
  end

  def self.random
    str = ""
    4.times do
      str += PEGS.sample
    end

    return str
  end
end

class Game
  attr_reader :secret_code
end

c = Code.new

p c.pegs