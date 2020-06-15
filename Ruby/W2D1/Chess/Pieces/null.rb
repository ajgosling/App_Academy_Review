require 'singleton'
class NullPiece < Piece
    include Singleton
    def initialize
        @color = :none
    end

    def to_s
        ' '
    end

    def inspect
        ' '
    end

    def moves
        []
    end

    def empty?
        true
    end
end