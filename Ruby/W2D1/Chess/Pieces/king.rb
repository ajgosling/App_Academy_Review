require_relative 'piece'
require_relative 'stepable'

class King < Piece
    def to_s
        'K'
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