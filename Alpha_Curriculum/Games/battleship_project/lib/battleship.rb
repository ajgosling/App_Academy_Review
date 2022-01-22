require_relative "board"
require_relative "player"

class Battleship
  attr_reader :board, :player
  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = @board.size / 2
  end

  def start_game
    @board.place_random_ships
    puts "#{@board.num_ships} ships have been placed.  Good luck!"
    @board.print
  end

  def lose?
    if @remaining_misses < 1
      puts "no guesses remaining.  You lose!"
      true
    else
      false
    end
  end

  def win?
    if @board.num_ships < 1
      puts "all ships destroyed.  You win!"
      true
    else
      false
    end
  end

  def game_over?
    lose? || win?
  end

  def turn
    pos = @player.get_move
    unless @board.attack(pos)
      @remaining_misses -= 1
    end
    @board.print
    puts "#{@remaining_misses} misses remaining!"
  end
end
