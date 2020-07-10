require_relative 'board.rb'

class Game
    attr_accessor :board
    def initialize
        @board = Board.new
    end

    def play
        until @board.solved?
            @board.render
            prompt_move_arr = prompt_move
            pos_arr = prompt_move_arr[0..1]
            val = prompt_move_arr[2]
            @board.update_pos(pos_arr, val)
        end

        p "yataaaaaa! the completed board:"
        @board.render
        return true

    end

    def prompt_move
        player_input = [1, 2, 3, 4, 5]
        until valid_move?(player_input)
            p "Give us a move luv! {row, col}, val"
            player_input = gets.chomp.chars
            player_input.delete(",")
            player_input.delete(" ")
            player_input.map!(&:to_i)

        end
        return player_input
    end

    def valid_move?(pos_arr)
        return false unless pos_arr.length == 3
        return false unless pos_arr[0..1].all? {|num| num >= 0 && num <= 8}
        return pos_arr.last >= 0 && pos_arr.last <= 9
    end
end

g = Game.new
g.play