require_relative 'board'
require_relative 'display'

class Game
    attr_accessor :board, :display
    def initialize
        @board = Board.new
        @display = Display.new(@board)
    end

    def render
        @display.render
    end
end
g = Game.new



# p b[[1, 2]].my_moves

# arr = []
# arr << "red".colorize(:red).on_blue
# arr << "blue".colorize(:blue).on_red
# puts arr.join(' ')
# puts "This is red on blue and underline".colorize(:red).on_blue.underline
g.render
# p g.board[[1, 2]].moves
# g.board.move_piece([1, 2], [3, 2])
# g.board.move_piece([3, 2], [4, 2])
# g.board.move_piece([4, 2], [5, 2])
# g.board.move_piece([6, 3], [5, 3])

# g.board.display



# n = NullPiece.instance
# b = NullPiece.instance
# p n == b

# p b.null_piece.empty?