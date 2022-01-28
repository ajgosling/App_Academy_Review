require_relative "card.rb"
require_relative "board.rb"
require_relative "human_player.rb"

class Game
  attr_accessor :board, :prev_guess_pos, :guess_count
  def initialize(player=HumanPlayer.new)
    @player = player
    @board = Board.new
    @prev_guess_pos = nil
    @guess_count = 0
  end

  def play
    system("clear")
    msg = "have a great game!"
    until over?
      render
      puts msg
      msg = make_guess(@player.prompt)
      system("clear")
    end
    render
    puts "good game! it took you #{@guess_count} guesses to finish!"
  end

  def make_guess(guessed_pos)
    @guess_count += 1
    @board.reveal(guessed_pos)
    if @prev_guess_pos
      if board.match?(@prev_guess_pos, guessed_pos)
        # is a match, leave both cards face up
        reset_prev_guess
        return "it was a match!"
      else
        # not a match, sleep for 3 seconds
        system("clear")
        render
        puts "it wasn't a match... :("
        sleep(3)
        @board.hide(@prev_guess_pos)
        @board.hide(guessed_pos)
        reset_prev_guess
        return "it wasn't a match... :("
      end
    else
      @prev_guess_pos = guessed_pos
      return "previous_guess_was #{@board[@prev_guess_pos]}"
    end
  end

  def reset_prev_guess
    @prev_guess_pos = nil
  end

  def over?
    @board.won?
  end

  def render
    @board.render
  end
end


if __FILE__ == $PROGRAM_NAME
  g = Game.new
  g.play
end