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
        if @cursor.selected
            selected_moves = @board[@cursor.selected].moves
        else
            selected_moves = []
        end

        @board.rows.each_with_index do |row, i|
            row.each_with_index do |piece, j|
                # light selected square
                if @cursor.selected == [i, j]
                    print_row << " #{piece} ".colorize(piece.color).on_red
                # light square that cursor is on
                elsif @cursor.cursor_pos == [i, j]
                    print_row << " #{piece} ".colorize(piece.color).on_magenta
                # light squares that selected piece can move to
                elsif selected_moves.include?([i, j])
                    print_row << " #{piece} ".colorize(piece.color).on_white
                # alternate colors
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