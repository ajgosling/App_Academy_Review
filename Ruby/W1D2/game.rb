require_relative 'board.rb'

class Game

    def initialize
        @board = Board.new
        @previous_guess = nil
    end

    def play
        until @board.won?
            @board.render

            prompt_move
        end
    end

    # def prompt_move
    #     p "-=-=-=-=-=-=-"
    #     p "make a guess!"
    #     return gets.chomp
    # end

    # def make_guess
    #     if @previous_guess

    #     end
    # end
end