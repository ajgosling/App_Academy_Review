require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
    include Slideable

    def to_s
        '♛'.colorize(color)
    end

    def inspect
        'Q'
    end

    def move_dirs
        HORIZONTAL_AND_VERTICAL + DIAGONAL
    end
end