require_relative 'pieces'
require 'byebug'
require 'colorize'

class Board
    attr_accessor :rows, :null_piece

    def initialize
        # we want to put null pieces in grid eventually

        @null_piece = NullPiece.instance

        @rows = generate_rows
    end

    def move_piece(start_pos, end_pos)
        raise "invalid start position!" unless valid_pos?(start_pos)
        raise "invalid end position!" unless valid_pos?(end_pos)
        raise "no piece at starting position!" if empty?(start_pos)
        unless self[start_pos].moves.include?(end_pos)
            raise "piece doesn't move that way!"
        end
        # move piece if valid move
        self[start_pos], self[end_pos] = @null_piece, self[start_pos]
        self[end_pos].pos = end_pos
    end

    def valid_pos?(pos)
        pos.all? {|num| num >= 0 && num <= 7}
    end

    def empty?(pos)
        self[pos].empty?
    end

    def [](pos)
        return @rows[pos.first][pos.last]
    end

    def []=(pos, val)
        @rows[pos.first][pos.last] = val
    end

    def generate_rows
        # we want 2 rows of 8 pieces, color board / pos
        rows = []

        rows << generate_piece_row("white")
        rows << generate_pawn_row("white")
        4.times { rows << generate_empty_row }
        rows << generate_pawn_row("black")
        rows << generate_piece_row("black")

        rows
    end

    def generate_piece_row(color)
        row = color == "white" ? 0 : 7
        pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]


        pieces.map.with_index { |c, i| c.new(color, self, [row, i]) }
    end

    def generate_pawn_row(color)
        row_idx = color == "white" ? 1 : 6
        row = []

        8.times {|i| row << Pawn.new(color, self, [row_idx, i])}

        row
    end

    def generate_empty_row
        return Array.new(8, @null_piece)
    end

    def display

        letters = "hgfedcba"
        puts "    1 2 3 4 5 6 7 8"
        puts "  X ---------------"
        @rows.reverse.each_with_index {|row, i| puts "#{letters[i]} | #{row.join(" ")}"}
    end
end

b = Board.new


# p b[[1, 2]].my_moves
b.display
p b[[1, 2]].moves
b.move_piece([1, 2], [3, 2])
b.move_piece([3, 2], [4, 2])
# b.move_piece([4, 2], [5, 2])
b.move_piece([6, 3], [5, 3])

b.display

# puts b[[2, 3]]
# b.move_piece([1, 2], [2, 3])
# b.display
# p b[[2, 3]].color


# n = NullPiece.instance
# b = NullPiece.instance
# p n == b

# p b.null_piece.empty?