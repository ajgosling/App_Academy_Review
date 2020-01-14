require_relative 'board.rb'
require_relative 'player.rb'

class BattleshipGame
  attr_reader :board, :player

  def initialize(player, board)
    @player = player
    @board = board
  end

  def attack(pos)
    @board[pos] = :x
  end

  def count
    return @board.count
  end

  def game_over?
    return @board.won?
  end

  # def play_turn
  #   # need to curate string into position

  #   pos = gets.chomp.split(",")
  #   self.attack(pos)
  # end
end

# b = Board.new

# b.display