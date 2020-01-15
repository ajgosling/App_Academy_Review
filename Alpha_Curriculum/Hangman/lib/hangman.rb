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
    letter = @guesser.guess
    hits = @referee.check_guess(letter)

    @guesser.handle_response(letter, hits)
    self.update_board(letter, hits)
  end

  def update_board(letter, hits)
    hits.each do |i|
      @board[i] = letter
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
  attr_reader :candidate_words
  def initialize(dict)
    @dictionary = dict
    @candidate_words = @dictionary
    @potential_guesses = ("a".."z").to_a
  end

  def pick_secret_word
    @secret_word = @dictionary.sample
    return @secret_word.length
  end

  def check_guess(letter)
    hits = []
    @secret_word.each_char.with_index do |char, i|
      hits << i if char == letter
    end

    return hits
  end

  def register_secret_length(len)
    @word_length = len
    @candidate_words.select! {|word| word.length == len}
    @secret_word = Array.new(len)
  end

  def guess(board)
    letter_hash = Hash.new(0)

    @candidate_words.each do |word|
      word.split("").uniq.each do |uniq_char|
        letter_hash[uniq_char] += 1
      end
    end

    return letter_hash.sort_by {|k, v| v}[-1][0]
  end

  def handle_response(letter, arr)
    arr.each do |idx|
      @secret_word[idx] = letter
    end

    @candidate_words.select! do |word|
      arr.all? {|idx| word[idx] == letter} && arr.length == word.count(letter)
    end

    return true
  end
end

# c = ComputerPlayer.new

# f = File.new("dictionary.txt")