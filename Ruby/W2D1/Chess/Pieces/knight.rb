require_relative 'piece'
require_relative 'stepable'

class Knight < Piece
    include Stepable

    def to_s
        '♞'.colorize(color)
    end

    def inspect
        'H'
    end
    def move_diffs
        [
            [1, 2],
            [1, -2],
            [-1, 2],
            [-1, -2],
            [2, 1],
            [2, -1],
            [-2, 1],
            [-2, -1]
        ]
    end
end