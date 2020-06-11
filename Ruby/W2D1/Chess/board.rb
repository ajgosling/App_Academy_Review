require_relative 'piece'

class Board
    attr_accessor :rows
    def initialize
        # we want to put null pieces in grid eventually
        @rows = []

        2.times { @rows << generate_piece_row("white") }
        4.times { @rows << generate_empty_row }
        2.times { @rows << generate_piece_row("black") }
    end

    def move_piece(start_pos, end_pos)
        raise "invalid start position!" unless valid_pos?(start_pos)
        raise "invalid end position!" unless valid_pos?(end_pos)
        raise "no piece at starting position!" if self[start_pos].nil?
        # raise "can't move to occupied position!" if self[start_pos].nil?
    end

    def valid_pos?(pos)
        pos.all? {|num| num >= 0 && num <= 7}
    end

    def [](pos)
        return @rows[pos.first][pos.last]
    end

    def []=(pos, val)
        @rows[pos.first][pos.last] = val
    end

    def generate_piece_row(color)
        return Array.new(8, Piece.new(color))
    end

    def generate_empty_row
        return Array.new(8, nil)
    end

    def inspect
        @rows
    end
end


b = Board.new

p b.valid_pos?([4, 8])

