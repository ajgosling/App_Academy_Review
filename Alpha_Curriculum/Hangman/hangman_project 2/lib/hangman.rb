class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  attr_reader :attempted_chars, :guess_word, :remaining_incorrect_guesses

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    arr = []
    @secret_word.each_char.with_index {|el, i| arr << i if el == char}
    arr
  end

  def fill_indices(char, arr)
    arr.each {|idx| @guess_word[idx] = char}
  end

  def try_guess(char)
    unless already_attempted?(char)
      indices = get_matching_indices(char)
      @remaining_incorrect_guesses -= 1 if indices.empty?
      fill_indices(char, indices)
      @attempted_chars << char
      return true
    else
      p "#{char} has already been attempted"
      return false
    end
  end

  def ask_user_for_guess
    p "Enter a char:"
    char = gets.chomp
    return try_guess(char)
  end

  def win?
    if @guess_word.join == @secret_word
      p "WIN!"
      return true
    end
    return false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE!"
      return true
    end
    return false
  end

  def game_over?
    if win? || lose?
      p @secret_word
      return true
    end
    return false
  end
end
