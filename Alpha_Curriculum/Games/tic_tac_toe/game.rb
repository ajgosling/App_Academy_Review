require_relative 'board.rb'
require_relative 'human_player.rb'

class Game
  attr_reader :player1, :player2, :current_player
  def initialize(mark1, mark2)
    @player1 = HumanPlayer.new(mark1)
    @player2 = HumanPlayer.new(mark2)
    @board = Board.new
    @current_player = @player1
  end

  def switch_turn
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def play
    while @board.empty_positions?
      puts "------------------------------"
      @board.print
      mark = @current_player.mark
      pos = @current_player.get_position
      @board.place_mark(pos, mark)
      if @board.win?(mark)
        @board.print
        puts "victory!!!!!!!!! for #{mark}"
        return
      end
      switch_turn
    end
    @board.print
    puts "it's a draw!!!!! thanks for playing!!!!"
    return
  end
end

# Game#play
# This method will contain the main game loop. Here is some psuedocode for the loop:

# while there exists empty positions on the board
# print the board
# get a position from the current player
# place their mark at that position of the board
# check if that user has won
# if they win, print out a 'victory' message saying who won and return to end the game
# otherwise they did not win, so switch turns
# if we finish the while loop without returning, that means there are no more empty positions on the board and noone has won, so print a 'draw' message

g = Game.new(:X, :O)

g.play