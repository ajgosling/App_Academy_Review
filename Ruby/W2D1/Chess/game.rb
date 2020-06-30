require_relative 'board'
require_relative 'display'

class Game
    attr_accessor :board, :display
    def initialize
        @board = Board.new
        @display = Display.new(@board)
    end

    def render
        @display.render
    end

    def play
        system('clear')

        while true
            system('clear')
            @display.render
            @display.cursor.get_input
            p @display.cursor.cursor_pos
        end
    end
end
g = Game.new




g.render
g.play


