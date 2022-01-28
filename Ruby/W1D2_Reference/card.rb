class Card
  attr_accessor :value, :revealed
  def Card.generate_card_pair_arr
    value = "23456789TJQKA".chars.sample
    [Card.new(value), Card.new(value)]
  end
  def initialize(value)
    @value = value
    @revealed = false
  end
  def hide
    @revealed = false
  end
  def reveal
    @revealed = true
  end
  def ==(other)
    @value == other.value
  end
  def to_s
    @revealed ? @value : "?"
  end
  def inspect
    @value
  end
end

if __FILE__ == $PROGRAM_NAME
  p Card.generate_card_pair_arr
end