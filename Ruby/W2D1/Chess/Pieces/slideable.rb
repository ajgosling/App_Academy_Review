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
        p move_dirs
    end
end