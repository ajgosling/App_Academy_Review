require_relative 'piece'

class Pawn < Piece

    def to_s
        '♟'.colorize(color)
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

    def side_attacks
        pos_left = [@pos.first + forward_dir, @pos.last - 1]
        pos_right = [@pos.first + forward_dir, @pos.last + 1]

        #check squares for being not empty and not the same color
        poss_moves = [pos_left, pos_right].select {|el| @board.valid_pos?(el)}
        poss_moves.select {|el| @board[el].color == @color}
    end
end