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
    # return the most common letter in potential guesses that hasn't been guessed
    @potential_guesses -= board

    big_str = @candidate_words.join("")

    # start by assigning guess to first possible letter
    new_guess = @potential_guesses.first
    guess_tally = big_str.count(new_guess)

    @potential_guesses.each do |letter|
      curr_guest_tally = big_str.count(letter)
      if curr_guest_tally > guess_tally
        new_guess = letter
        guess_tally = curr_guest_tally
      end
    end

    # delete guess from potential guesses
    @potential_guesses.delete(new_guess)

    return new_guess
  end

  def handle_response(letter, arr)
    # filter out candidate words to keep only the words that have the letter at all designated indexes

    @candidate_words.select! do |word|
      if arr.all? {|idx| word[idx] == letter}
        if word.count(letter) == arr.length
          true
        else
          false
        end
      else
        false
      end
    end

    # iterate through secret word and replace each index with letter
    arr.each do |idx|
      @secret_word[idx] = letter
    end


    return true
  end
end

# c = ComputerPlayer.new

# f = File.new("dictionary.txt")