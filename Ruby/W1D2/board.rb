require_relative 'card.rb'

class Board
    attr_accessor :grid
    def self.populate
        return Array.new(4) { Array.new(4) {Card.new} }
    end

    def initialize
        @grid = Board.populate
    end

    def [](pos)
        return @grid[pos.first][pos.last]
    end

    def []=(pos, val)
        @grid[pos.first][pos.last] = val
    end

    def render
        puts "! 0 1 2 3"

        @grid.each_with_index do |row, i|
            puts "#{i} #{row.join(" ")}"
        end
    end

    def won?
        return @grid.flatten.none? {|card| card.to_s == 'x'}
    end

    def reveal(pos_arr)
        # returns value of revealed card
        return self[pos_arr].reveal
    end
end