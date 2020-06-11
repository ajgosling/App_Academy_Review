module Stepable
    def moves
        # iterate over move diffs, change pos according to move dif
        # make sure result is a valid move
        moves_arr = []
        move_diffs.each do |diff|
            moves_arr << [@pos.first + diff.first, @pos.last + diff.last]
        end

        return moves_arr
    end
end