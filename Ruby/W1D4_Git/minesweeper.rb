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

  def message_player
    puts "f for `flag`, r for `reveal`"
    puts "enter `f` or `r` plus a position e.g. `f 3,4`"
  end

  def get_user_input
    message_player
    user_input = clarify_user_input(gets.chomp.chars)
    until user_input
      puts "that input was improper!"
      message_player
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
    system("clear")
    @board.display
  end


  def play
    display
    # handle_user_input will return false if the user reveals a bomb
    until @board.won? || !handle_user_input(get_user_input)
      display
    end

    display
    game_end_message
  end

  def game_end_message
    if @board.won?
      puts "congrats! you win!"
    else
      puts "oh no! you blew up a bomb!"
    end
  end
end


if __FILE__ == $PROGRAM_NAME
  m = Minesweeper.new
  m.play
end