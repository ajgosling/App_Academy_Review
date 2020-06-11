class Piece
    def initialize(color)
        @color = color
    end

    def inspect
        @color[0]
    end

    def to_s
        @color[0]
    end
end