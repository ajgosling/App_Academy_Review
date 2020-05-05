require 'set'

class WordChainer
    attr_reader :dictionary

    def initialize(dictionary_file_name)
        file = File.open(dictionary_file_name)
        @dictionary = (file.readlines.map {|l| l.rstrip}).to_set
    end

    def run(source, target)
        @current_words = [source]
        @all_seen_words = { source => nil }

        until @current_words.empty?

            new_current_words = explore_current_words

            if @all_seen_words.has_key?(target)
                return build_path(target)
            end

            @current_words = new_current_words
        end
    end

    def build_path(target)
        path_arr = []
        next_step = target
        until next_step.nil?
            path_arr << next_step
            next_step = @all_seen_words[next_step]
        end

        return path_arr.reverse
    end

    def explore_current_words
        new_current_words = []
        @current_words.each do |current_word|
            adjacent_words(current_word).each do |adj_word|
                unless @all_seen_words.has_key?(adj_word)
                    @all_seen_words[adj_word] = current_word
                    new_current_words << adj_word
                end
            end
        end

        return new_current_words
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
p w.run("box", "cry")