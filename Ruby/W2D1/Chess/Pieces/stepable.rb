module Stepable
    def moves
        # iterate over move diffs, change pos according to move dif
        # make sure result is a valid move
        moves_arr = []
        move_diffs.each do |diff|
            poss_pos = [@pos.first + diff.first, @pos.last + diff.last]

            # move must be on screen
            next unless @board.valid_pos?(poss_pos)
            # end idx must not be own color
            next if @color == @board[poss_pos].color

            next unless @board[poss_pos].empty?

            moves_arr << poss_pos
        end

        return moves_arr
    end
end