require_relative 'piece'
require_relative 'slideable'

class Bishop < Piece
    include Slideable

    def to_s
        'B'
    end

    def inspect
        'B'
    end

    def move_dirs
        DIAGONAL
    end
end