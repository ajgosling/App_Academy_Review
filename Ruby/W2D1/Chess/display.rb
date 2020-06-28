require 'colorize'
require_relative 'cursor'

class Display
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        letters = "hgfedcba"
        puts "    1 2 3 4 5 6 7 8"
        puts "  X ---------------"

        # @rows.reverse.each_with_index {|row, i| puts "#{letters[i]} | #{row.join(" ")}"}

        @board.rows.reverse.each_with_index do |row, i|
            if i.even?
                render_even_row(row)
            else
                render_odd_row(row)
            end
        end
    end

    def render_even_row(row)
        row = ''
        row.each do |el|

        end
    end

    def render_odd_row(row)
        puts row.join(' ')
    end
end

# puts "This is blue".colorize(:blue)
# puts "This is light blue".colorize(:light_blue)
# puts "This is also blue".colorize(:color => :blue)
# puts "This is light blue with red background".colorize(:color => :light_blue, :background => :red)
# puts "This is light blue with red background".colorize(:light_blue ).colorize( :background => :red)
# puts "This is blue text on red".blue.on_red
# puts "This is red on blue".colorize(:red).on_blue
# puts "This is red on blue and underline".colorize(:red).on_blue.underline
# puts "This is blue text on red".blue.on_red.blink
# puts "This is uncolorized".blue.on_red.uncolorize