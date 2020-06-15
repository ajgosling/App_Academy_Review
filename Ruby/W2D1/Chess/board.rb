require_relative 'pieces'
require 'byebug'

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

        2.times { |time| rows << generate_piece_row("white", time) }
        4.times { rows << generate_empty_row }
        2.times { |time| rows << generate_piece_row("black", time + 6) }

        rows
    end

    def generate_piece_row(color, idx)
        row = []

        8.times {|time| row << Rook.new(color, self, [idx, time])}

        row
    end

    def generate_empty_row
        return Array.new(8, @null_piece)
    end

    def display
        @rows.reverse.each {|row| puts row.join(" ")}
    end
end

b = Board.new


p b[[1, 2]].moves
b.display
b.move_piece([1, 2], [2, 2])
b.display
p b[[2, 2]].moves


# n = NullPiece.instance
# b = NullPiece.instance
# p n == b

# p b.null_piece.empty?