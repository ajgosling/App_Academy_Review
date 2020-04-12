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

    def to_s
    end
end

b = Board.new

puts b.grid.first