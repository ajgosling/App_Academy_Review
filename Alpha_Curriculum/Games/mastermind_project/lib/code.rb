class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(arr)
    arr.all? {|peg| POSSIBLE_PEGS.include?(peg.upcase)}
  end

  def self.random(num)
    arr = []
    num.times {arr << POSSIBLE_PEGS.keys.sample}
    Code.new(arr)
  end

  def self.from_string(str)
    Code.new(str.chars)
  end

  def initialize(arr)
    raise "invalid pegs" unless Code.valid_pegs?(arr)
    @pegs = arr.map(&:upcase)
  end

  def [](i)
    @pegs[i]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(other_code)
    count = 0
    @pegs.each_with_index {|el, i| count += 1 if el == other_code[i]}
    count
  end

  def num_near_matches(other_code)
    count = 0
    POSSIBLE_PEGS.keys.each do |color|
      count += [@pegs.count(color), other_code.pegs.count(color)].min
    end
    count - num_exact_matches(other_code)
  end

  def ==(other_code)
    return @pegs == other_code.pegs
  end
end
