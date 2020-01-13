# require 'byebug'
class Code
  attr_reader :pegs

  # def random
end

class Game
  attr_reader :secret_code
end

class Array
  def average

    return self.sum / self.length.to_f
  end

end

p [1, 2, 3, 4].average
