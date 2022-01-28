require_relative "card.rb"

class Board
  def Board.generate_random_grid
    card_arr = []
    6.times {card_arr += Card.generate_card_pair_arr}
    card_arr.shuffle!
    [card_arr[0...4], card_arr[4...8], card_arr[8..-1]]
  end

  attr_accessor :grid
  def initialize
    @grid = Board.generate_random_grid
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def render
    puts "  0 1 2 3"
    @grid.each_with_index do |row, idx|
      puts "#{idx} #{row.join(" ")}"
    end
  end

  def won?
    @grid.flatten.all? {|card| card.revealed}
  end

  def reveal(guessed_pos)
    card = self[guessed_pos]
    card.reveal
    card.value
  end

  def hide(guessed_pos)
    card = self[guessed_pos]
    card.hide
    card.value
  end

  def match?(pos1, pos2)
    self[pos1] == self[pos2]
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  p b.grid
  b.render
  b.reveal([0, 0])
  b.reveal([0, 1])
  b.reveal([0, 2])
  b.reveal([0, 3])
  b.reveal([1, 0])
  b.reveal([1, 1])
  b.reveal([1, 2])
  b.reveal([1, 3])
  b.reveal([2, 0])
  b.reveal([2, 1])
  b.reveal([2, 2])
  b.reveal([2, 3])
  b.render
  p b.won?
end