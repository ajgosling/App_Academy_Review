require_relative 'board.rb'

class Game

    def initialize
        @board = Board.new
        @previous_guess = nil
    end

    def play
        until @board.won?
            @board.render

            make_guess(prompt_move)
        end
    end

    def prompt_move
        p "-=-=-=-=-=-=-"
        p "make a guess!"
        guess = gets.chomp

        until valid_guess?(guess)
            p "-=-=-=-=-=-=-"
            p "make a guess!"
            guess = gets.chomp
        end
        return guess.split(", ").map {|el| el.to_i}
    end

    def valid_guess?(str)
        arr = str.split(", ").map {|el| el.to_i}
        return arr.length == 2 && arr.all? {|num| num >= 0 && num <= 4}
    end

    def make_guess(pos_arr)
        if @previous_guess
            # check if pos_arr is a match
            @board.reveal(pos_arr)
            if @board[pos_arr] != @board[@previous_guess]
                # hide both guesses
                @board.hide(@previous_guess)
                @board.hide(pos_arr)
            end
            @previous_guess = nil
        else
            @board.reveal(pos_arr)
            @previous_guess = pos_arr
        end
    end
end

g = Game.new

p g.play