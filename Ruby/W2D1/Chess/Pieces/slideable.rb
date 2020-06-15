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

    # def moves
    #     # iterate over move diffs, change pos according to move dif
    #     # make sure result is a valid move
    #     moves_arr = []
    #     move_diffs.each do |diff|
    #         poss_pos = [@pos.first + diff.first, @pos.last + diff.last]

    #         # move must be on screen
    #         next unless @board.valid_pos?(poss_pos)
    #         # end idx must not be own color
    #         unless @board.empty?(poss_pos)
    #             next if @color == @board[poss_pos].color
    #         end


    #         moves_arr << poss_pos
    #     end

    #     return moves_arr
    # end

    def moves
        # iterate over move_dirs
        # with each dir, extend in that direction for as long as we have valid move
            # a move becomes invalid if:
                # we move off the board
                # we hit a piece of the same color (break)
                # we hit a piece of the opposite color (add that slot)

        move_dirs.each do |dir|
            p @pos
            p dir
            new_pos = [@pos.first + dir.first, @pos.last + dir.last]
            while true
                p new_pos
                break
            end
        end

    end
end