require_relative 'piece'
require_relative 'stepable'

class King < Piece
    include Stepable

    def to_s
        '♚'.colorize(color)
    end

    def inspect
        '♚'.colorize(color)
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