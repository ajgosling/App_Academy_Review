class HumanPlayer
  def valid_guess?(guessed_pos)
    return false unless guessed_pos.length == 2
    guessed_pos.all? {|i| i.is_a?(Integer) && i >= 0 && i <= 3}
  end

  def prompt
    print "guess a new position `row col`: "
    guessed_pos = gets.chomp.split.map(&:to_i)
    until valid_guess?(guessed_pos)
      puts "invalid guess! guess again:"
      guessed_pos = gets.chomp.split.map(&:to_i)
    end
    guessed_pos
  end

  def receive_revealed_card(val, pos)
  end

  def receive_match(val, pos1, pos2)
  end
end