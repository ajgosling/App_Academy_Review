# require 'byebug'
class Code
  attr_reader :pegs

  PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow,
    "O" => :orange,
    "P" => :purple,
  }

  def initialize(pegs)
    @pegs = pegs
  end

  def self.parse(str)
    str = str.chomp.upcase
    unless str.length == 4 && str.chars.all? {|c| PEGS.has_key?(c)}
      raise ArgumentError
    end
    new_pegs = str.chars.map {|c| PEGS[c]}

    return Code.new(new_pegs)
  end

  def self.random
    colors = []
    4.times do
      colors << PEGS.values.sample
    end

    return Code.new(colors)
  end

  def [](i)
    @pegs[i]
  end

  def ==(other)
    return false unless other.is_a?(Code)
    return self.pegs == other.pegs
  end

  def exact_matches(other)
    count = 0

    4.times do |idx|
      count += 1 if self[idx] == other[idx]
    end

    return count
  end

  def near_matches(other)
    count = 0
    PEGS.values.each do |color|
      count += [@pegs.count(color), other.pegs.count(color)].min
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
        puts "Sorry! the code was #{@secret_code.pegs}"
        return true
      end


      display_matches(guess)
      guess = get_guess
    end

    puts "Congrats! code was #{secret_code.pegs}"
  end

  def display_matches(guess)
    puts "exact matches: #{@secret_code.exact_matches(guess)}"
    puts "near matches: #{@secret_code.near_matches(guess)}"
    puts "guesses left: #{10 - @guess_count}"
  end

  def get_guess
    print "give a guess luv: "
    return Code.parse(gets.chomp.upcase)


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
    str.length == 4 && str.split("").all? {|c| "RGBYOP".include?(c)}
  end

end
c1 = Code.parse("BBYY")
c2 = Code.parse("BYBY")


