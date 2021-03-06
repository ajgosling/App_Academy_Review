module Slideable
    HORIZONTAL_AND_VERTICAL = [
        [0, 1],
        [1, 0],
        [0, -1],
        [-1, 0]
    ]

    DIAGONAL = [
        [1, 1],
        [-1, 1],
        [1, -1],
        [-1, -1]
    ]

    def moves
        # iterate over move_dirs
        # with each dir, extend in that direction for as long as we have valid move
            # a move becomes invalid if:
                # we move off the board
                # we hit a piece of the same color (break)
                # we hit a piece of the opposite color (add that slot)
        moves_arr = []

        move_dirs.each do |dir|
            curr_pos = [@pos.first + dir.first, @pos.last + dir.last]
            while @board.valid_pos?(curr_pos)
                pos_piece = @board[curr_pos]
                if pos_piece.empty?
                    moves_arr << curr_pos
                elsif @board[curr_pos].color == @color
                    break
                else
                    # we can take opposite color piece and then stop
                    moves_arr << curr_pos
                    break
                end

                curr_pos = [curr_pos.first + dir.first, curr_pos.last + dir.last]

            end
        end

        return moves_arr
    end
end