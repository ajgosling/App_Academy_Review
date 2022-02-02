require 'set'
class WordChainer
  attr_reader :dictionary
  def initialize(file='dictionary.txt')
    @dictionary = File.open(file).readlines.map(&:chomp)
    @dictionary = Set[*@dictionary]
  end

  def adjacent_words(word)
    adjacent_arr = []
    alpha = ("a".."z")

    word.each_char.with_index do |c, i|
      alpha.each do |letter|
        next if letter == c
        new_word = word.dup
        new_word[i] = letter
        adjacent_arr << new_word if @dictionary.include?(new_word)
      end
    end
    adjacent_arr
  end

  def explore_current_words
    new_current_words = []
    @current_words.each do |current_word|
      new_words = adjacent_words(current_word)
      new_words.reject! {|w| @all_seen_words.include?(w)}
      new_current_words += new_words
      add_to_all_seen_words(new_words, current_word)
    end
    @current_words = new_current_words
  end

  def add_to_all_seen_words(new_words_arr, current_word)
    new_words_arr.each {|word| @all_seen_words[word] = current_word}
  end

  def build_path(target)
    return nil unless @all_seen_words.include?(target)
    path_arr = []
    until target.nil?
      path_arr.unshift(target)
      target = @all_seen_words[target]
    end
    path_arr
  end

  def run(source, target)
    @current_words = [source]
    @all_seen_words = {source => nil}
    until @all_seen_words.include?(target) || @current_words.empty?
      explore_current_words
    end
    build_path(target)
  end
end

w = WordChainer.new

p w.run("duck", "ruby")