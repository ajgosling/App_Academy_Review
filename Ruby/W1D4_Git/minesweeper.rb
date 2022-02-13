require_relative "board.rb"

class Minesweeper
  attr_accessor :board
  def initialize
    @board = Board.generate_random_board
  end

  def clarify_user_input(user_input)
    command = user_input[0].downcase
    return false unless "fr".include?(command)
    user_input.select! {|char| "0123456789,".include?(char)}
    pos_arr = user_input.join.split(",")
    pos_arr.map! {|el| el.to_i - 1}
    return false unless pos_arr.length == 2
    return false unless @board.valid_pos(pos_arr)
    return [command, pos_arr]
  end

  def get_user_input
    puts "f for `flag`, r for `reveal`"
    puts "enter `f` or `r` plus a position e.g. `f 3,4`"
    user_input = clarify_user_input(gets.chomp.chars)
    until user_input
      user_input = clarify_user_input(gets.chomp.chars)
    end
    user_input
  end

  def handle_user_input(user_input_arr)
    command, pos = user_input_arr
    if command == "f"
      @board.flag(pos)
    else
      @board.reveal(pos)
    end
  end

  def display
    @board.display
  end

  # CONTINUE CODING OUT GAME OVER FUNCTION AND PLAY FUNCTION
  def game_over?
    @board.won? || @board.lost?
  end


  def play
    # display
    # until handle_user_input(get_user_input)
  end
end


if __FILE__ == $PROGRAM_NAME
  m = Minesweeper.new
  m.display
  # debugger
  while true
    m.handle_user_input(m.get_user_input)
    m.display
  end
end