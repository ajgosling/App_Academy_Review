require_relative 'piece'

class Pawn < Piece

    def to_s
        '♟'.colorize(color)
    end

    def inspect
        'P'
    end

    def at_start_row?
        return @color == :white ? @pos.first == 6 : @pos.first == 1
    end

    def moves
        side_attacks + forward_steps
    end

    def forward_dir
        return @color == :white ? -1 : 1
    end

    def forward_steps
        # check square in front of pawn
        # if invalid move, return []
        # if valid, and if we're at start row, check 2 squares ahead
        steps = []
        first_pos = [@pos.first + forward_dir, @pos.last]
        return steps unless @board.valid_pos?(first_pos)
        return steps unless @board.empty?(first_pos)
        steps << first_pos
        return steps unless at_start_row?
        second_pos = [first_pos.first + forward_dir, @pos.last]
        return steps unless @board.valid_pos?(second_pos)
        return steps unless @board.empty?(second_pos)
        steps << second_pos
        return steps
    end

    def side_attacks
        pos_left = [@pos.first + forward_dir, @pos.last - 1]
        pos_right = [@pos.first + forward_dir, @pos.last + 1]

        # debugger
        #check squares for being not empty and not the same color
        poss_moves = [pos_left, pos_right].select {|el| @board.valid_pos?(el)}
        # poss_moves.select {|el| @board[el].color == @color}
        poss_moves.select! do |el|
            if @color == :white
                @board[el].color == :black
            else
                @board[el].color == :white
            end
        end

        poss_moves
    end
end