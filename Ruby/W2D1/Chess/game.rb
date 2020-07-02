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
            # p @display.cursor.cursor_pos
        end
    end
end
g = Game.new




g.board.move_piece([7, 1], [5, 2])
g.board.move_piece([5, 2], [3, 1])
g.board.move_piece([3, 1], [1, 2])
p g.board.in_check?(:white)
g.render
# g.play


