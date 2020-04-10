require_relative 'tile.rb'

class Board
    def initialize(file_string = "./puzzles/sudoku1.txt")
        @grid = Board.from_file(file_string)
    end

    def Board.from_file(file_string)
        file = File.new(file_string)
        return file.readlines.map do |line|
            p line.chomp.chars.map(&:to_i)
        end
    end

    def to_s
    end
end

Board.from_file('./puzzles/sudoku1.txt')