class Hangman
  attr_reader :guesser, :referee, :board

  def initialize(players)
    @guesser = players[:guesser]
    @referee = players[:referee]
  end

  def setup
    @board = Array.new(@referee.pick_secret_word, nil)
    @guesser.register_secret_length(@board.length)
  end

  def take_turn
    guess = @guesser.guess
    hits = @referee.check_guess(guess)

    @guesser.handle_response(hits)
    self.update_board(hits, guess)
  end

  def update_board(hits, guess)
    hits.each do |i|
      @board[i] = guess
    end
  end
end

class HumanPlayer

  def initialize
  end

  def register_secret_length(len)
    puts "word length is #{len}"

    return true
  end
end

class ComputerPlayer

  def initialize(dict)
    @dict = dict
  end

  def pick_secret_word
    @secret_word = @dict.sample
    return @secret_word.length
  end

  def check_guess(letter)
    hits = []
    @secret_word.each_char.with_index do |char, i|
      hits << i if char == letter
    end

    return hits
  end
end
