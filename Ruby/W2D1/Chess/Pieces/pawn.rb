require_relative 'piece'

class Pawn < Piece

    def to_s
        'P'
    end

    def inspect
        'P'
    end

    def move_diffs
        [
            [0, 1],
            [0, -1],
            [1, 0],
            [-1, 0],
            [1, 1],
            [1, -1],
            [-1, 1],
            [-1, -1]
        ]
    end
end