class Piece
    attr_accessor :color, :board, :pos
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def inspect
        @color[0]
    end

    def to_s
        @color[0]
    end
end