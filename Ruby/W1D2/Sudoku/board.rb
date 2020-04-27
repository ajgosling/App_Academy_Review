require_relative 'tile.rb'

class Board
    attr_reader :grid
    def initialize(grid = Board.from_file('./puzzles/sudoku1.txt'))
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

    end

    def solved_boxes?

    end

    def solved_columns?
        return @grid.transpose.all? {|row| valid_set?(row)}
    end

    def solved_rows?
        return @grid.all? {|row| valid_set?(row)}
    end

    def valid_set?(arr)
        return false unless arr.all? {|el| el >= 1 && el <= 9}
        return arr.uniq.length == 9
    end

    def Board.format_row(arr)
        return "#{arr[0..2].join(" ")}|#{arr[0..2].join(" ")}|#{arr[0..2].join(" ")}"

    end
end

b = Board.new
# p Board.format_row([1, 2, 3, 4, 5, 6, 7, 8, 9])
b.render