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


# f2, f3
# e7, e5
# g2, g4
# d8, h4
g = Game.new

g.board.move_piece([1, 5], [2, 5])
g.board.move_piece([6, 4], [4, 4])
g.board.move_piece([1, 6], [3, 6])
g.board.move_piece([7, 3], [3, 7])
g.render

p g.board.checkmate?(:white)
# g.play


