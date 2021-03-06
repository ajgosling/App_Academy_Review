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

    def dup
    end

    def find_king(color)
        @rows.each_with_index do |row, i|
            row.each_with_index do |piece, j|
                if piece.is_a?(King) && piece.color == color
                    return [i, j]
                end
            end
        end
    end

    def in_check?(color)
        king_pos = find_king(color)

        @rows.flatten.any? do |piece|
            piece.color == opp_color(color) && piece.moves.include?(king_pos)
        end
    end

    def valid_moves(color)
        return []
    end

    def checkmate?(color)
        in_check?(color) && valid_moves(color).empty?
    end

    def opp_color(color)
        return color == :white ? :black : :white
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

        rows << generate_piece_row(:black)
        rows << generate_pawn_row(:black)
        4.times { rows << generate_empty_row }
        rows << generate_pawn_row(:white)
        rows << generate_piece_row(:white)

        rows
    end

    def generate_piece_row(color)
        row = color == :white ? 7 : 0
        pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]


        pieces.map.with_index { |c, i| c.new(color, self, [row, i]) }
    end

    def generate_pawn_row(color)
        row_idx = color == :white ? 6 : 1
        row = []

        8.times {|i| row << Pawn.new(color, self, [row_idx, i])}

        row
    end

    def generate_empty_row
        return Array.new(8, @null_piece)
    end

end