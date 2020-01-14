# require 'byebug'
class Code
  attr_reader :pegs

  def initialize(pegs)
    @pegs = pegs
  end

  def self.colors
    return ["R", "G", "B", "Y", "O", "P"]
  end

  def self.random
    str = ""
    4.times do
      str += Code.colors.sample
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
    Code.colors.each do |color|
      count += [self.pegs.count(color), other.pegs.count(color)].min
    end

    return count - self.exact_matches(other)
  end
end

class Game
  attr_reader :secret_code

  def initialize(secret_code = Code.random)
    @secret_code = secret_code

    @guess_count = 0

  end

  def play
    guess = get_guess
    until @secret_code.exact_matches(guess) == 4
      @guess_count += 1

      if @guess_count == 10
        puts "Sorry! the code was #{@secret_code}"
        return true
      end

      puts "exact matches: #{@secret_code.exact_matches(guess)}"
      puts "near matches: #{@secret_code.near_matches(guess)}"
      puts "guesses left: #{10 - guess_count}"

      guess = get_guess
    end

    puts "Congrats! code was #{secret_code}"
  end


  def get_guess
    print "give a guess luv: "
    guess = gets.chomp.upcase

    if valid_guess?(guess)
      return Code.new(guess)
    end

    until valid_guess?(guess)
      print "invalid guess! try again: "
      guess = gets.chomp.upcase
    end

    return Code.new(guess)
  end

  def valid_guess?(str)
    str.length == 4 && str.split("").all? {|c| Code.colors.include?(c)}
  end

end


g = Game.new
g.play