require 'colorize'
require_relative 'cursor'

class Display
    attr_accessor :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        color_flag = true

        print_row = []

        @board.rows.each_with_index do |row, i|
            row.each_with_index do |piece, j|
                if @cursor.cursor_pos == [i, j]
                    if @cursor.selected
                        print_row << " #{piece} ".colorize(piece.color).on_light_white
                    else
                        print_row << " #{piece} ".colorize(piece.color).on_magenta
                    end
                elsif color_flag
                    print_row << " #{piece} ".colorize(piece.color).on_blue
                else
                    print_row << " #{piece} ".colorize(piece.color).on_green
                end
                color_flag = !color_flag
            end

            puts print_row.join('')
            print_row = []
            color_flag = !color_flag
        end
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