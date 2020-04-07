require_relative 'card.rb'

class Board
    attr_accessor :grid
    def self.populate
        return Array.new(4) { Array.new(4) {Card.new} }
    end

    def initialize
        @grid = Board.populate
    end

    def render
        puts "! 0 1 2 3"

        @grid.each_with_index do |row, i|
            puts "#{i} #{row.join(" ")}"
        end
    end

    def won?
        @grid.flatten.none? {|card| card.to_s == 'x'}
    end
end


b1 = Board.new

# p b1.grid.length
b1.render