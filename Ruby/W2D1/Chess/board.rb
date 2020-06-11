require_relative 'piece'

class Board
    attr_accessor :rows
    def initialize
        # we want to put null pieces in grid eventually
        @rows = generate_rows

    end

    def move_piece(start_pos, end_pos)
        raise "invalid start position!" unless valid_pos?(start_pos)
        raise "invalid end position!" unless valid_pos?(end_pos)
        raise "no piece at starting position!" if self[start_pos].nil?
        # raise "can't move to occupied position!" if self[start_pos].nil?

        # move piece if valid move
        self[end_pos] = self[start_pos]
        self[start_pos] = nil
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

        8.times {|time| row << Piece.new(color, self, [idx, time])}

        row
    end

    def generate_empty_row
        return Array.new(8, nil)
    end

    def inspect
        @rows.reverse
    end

    def empty?
        return false
    end
end

b = Board.new
p b[[0, 2]].board