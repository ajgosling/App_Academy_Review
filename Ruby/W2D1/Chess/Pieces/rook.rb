require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
    include Slideable

    def to_s
        'R'
    end

    def inspect
        'R'
    end

    def move_dirs
        HORIZONTAL_AND_VERTICAL
    end
end