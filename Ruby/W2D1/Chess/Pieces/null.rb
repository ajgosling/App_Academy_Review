require 'singleton'
class NullPiece < Piece
    include Singleton
    def initialize
        @color = :none
    end

    def to_s
        'n'
    end

    def inspect
        'n'
    end

    def moves
        []
    end

    def empty?
        true
    end
end