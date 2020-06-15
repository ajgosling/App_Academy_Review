require_relative 'piece'

class Pawn < Piece

    def to_s
        'P'
    end

    def inspect
        'P'
    end

    def at_start_row?
        return @color == "white" ? @pos.first == 1 : @pos.first == 6
    end

    def moves

    end

    def forward_dir
        return @color == "white" ? 1 : -1
    end

    def forward_steps
        # check square in front of pawn
        # if invalid move, return []
        # if valid, and if we're at start row, check 2 squares ahead

    end
end