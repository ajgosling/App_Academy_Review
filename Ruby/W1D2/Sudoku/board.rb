require_relative 'tile.rb'

class Board
    attr_reader :grid
    def initialize(grid = Board.from_file('./puzzles/sudoku1_solved.txt'))
        @grid = grid
    end

    def Board.from_file(file_string)
        file = File.new(file_string)
        return file.readlines.map do |line|
            line.chomp.chars.map do |char|
                if char == '0'
                    Tile.new(char, false)
                else
                    Tile.new(char, true)
                end
            end
        end
    end

    def render
        @grid.each_with_index do |row, i|
            if i == 3 || i == 6
                puts "- - - - - - - - -"
            end
            puts Board.format_row(row)
        end
    end

    def solved?
        return solved_boxes? && solved_columns? && solved_rows?
    end

    def solved_boxes?
        boxes = [
            @grid[0][0..2] + @grid[1][0..2] + @grid[2][0..2],
            @grid[3][0..2] + @grid[4][0..2] + @grid[5][0..2],
            @grid[6][0..2] + @grid[7][0..2] + @grid[8][0..2],
            @grid[0][3..5] + @grid[1][3..5] + @grid[2][3..5],
            @grid[3][3..5] + @grid[4][3..5] + @grid[5][3..5],
            @grid[6][3..5] + @grid[7][3..5] + @grid[8][3..5],
            @grid[0][6..8] + @grid[1][6..8] + @grid[2][6..8],
            @grid[3][6..8] + @grid[4][6..8] + @grid[5][6..8],
            @grid[6][6..8] + @grid[7][6..8] + @grid[8][6..8]
        ]

        return boxes.all? {|row| valid_set?(row)}
    end

    def solved_columns?
        return @grid.transpose.all? {|row| valid_set?(row)}
    end

    def solved_rows?
        return @grid.all? {|row| valid_set?(row)}
    end

    def valid_set?(arr)
        return false unless arr.all? {|tile| tile.value >= "1" && tile.value <= "9"}
        return arr.uniq.length == 9
    end

    def Board.format_row(arr)
        return "#{arr[0..2].join(" ")}|#{arr[0..2].join(" ")}|#{arr[0..2].join(" ")}"

    end
end

b = Board.new
# p b.solved?
p b.render