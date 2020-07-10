require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_accessor :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if @board.over?
      if @board.tied?
        return false
      else
        return @board.winner != evaluator
      end
    end

    if evaluator == @next_mover_mark
      # it's my turn - does every child node result in a loss?
      return children.all? {|child| child.losing_node?(evaluator)}
    else
      # it's my opponent's turn = does any node result in a loss?
      return children.any? {|child| child.losing_node?(evaluator)}
    end
  end

  def winning_node?(evaluator)
    if @board.over?
      if @board.winner == evaluator
        return true
      else
        return false
      end
    end

    if evaluator == @next_mover_mark
      # it's my turn - does any child node result in a loss?
      return children.any? {|child| child.winning_node?(evaluator)}
    else
      # it's my opponent's turn = does every node result in a loss?
      return children.all? {|child| child.winning_node?(evaluator)}
    end

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children_arr = []

    @board.rows.each_with_index do |row, row_idx|
      row.each_with_index do |val, col_idx|
        if val.nil?
          # we need to make a new child node here
          new_rows = deep_dup(@board.rows)
          new_rows[row_idx][col_idx] = @next_mover_mark

          new_board = Board.new(new_rows)
          next_move = @next_mover_mark == :x ? :o : :x



          new_node = TicTacToeNode.new(new_board, next_move, [row_idx, col_idx])

          children_arr << new_node
        end
      end
    end

    return children_arr
  end
end


def deep_dup(arr)
  dupped_arr = []

  arr.each do |el|
    if el.is_a?(Array)
      dupped_arr << deep_dup(el)
    else
      dupped_arr << el
    end
  end

  return dupped_arr
end

