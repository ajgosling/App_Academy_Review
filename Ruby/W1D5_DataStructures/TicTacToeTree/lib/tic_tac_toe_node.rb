require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if @board.over?
      winner = @board.winner
      winner && winner != evaluator
    elsif @next_mover_mark == evaluator
      # it is our turn, check if every child is a loser
      children.all? {|child| child.losing_node?(evaluator)}
    else
      # it is not our turn, check if any child is a losing node
      children.any? {|child| child.losing_node?(evaluator)}
    end
  end

  def winning_node?(evaluator)
    if @board.over?
      @board.winner == evaluator
    elsif @next_mover_mark == evaluator
      # it is our turn, check if any child is a winner
      children.any? {|child| child.winning_node?(evaluator)}
    else
      # it is not our turn, check if every child is a winner
      children.all? {|child| child.winning_node?(evaluator)}
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    new_children = []
    3.times do |row|
      3.times do |col|
        pos = [row, col]
        if @board.empty?(pos)
          new_board = @board.dup
          new_board[pos] = @next_mover_mark
          new_node = TicTacToeNode.new(new_board, next_mark, pos)
          new_children << new_node
        end
      end
    end

    new_children
  end

  def next_mark
    @next_mover_mark == :x ? :o : :x
  end

end

if __FILE__ == $PROGRAM_NAME
  t = TicTacToeNode.new(Board.new, :x)
  p t.children.length
end