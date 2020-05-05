require 'set'

class WordChainer
    attr_reader :dictionary

    def initialize(dictionary_file_name)
        file = File.open(dictionary_file_name)
        @dictionary = (file.readlines.map {|l| l.rstrip}).to_set
    end

    def adjacent_words(word)
        # return all words in dictionary that are same len
        # and differ by only one letter

        @dictionary.select do |d_word|
            if d_word.length != word.length
                false
            else
                count = 0
                word.each_char.with_index do |c, i|
                    count += 1 if c != d_word[i]
                end
                count == 1
            end

        end
    end

end

w = WordChainer.new("dictionary.txt")

p w.adjacent_words("cat")