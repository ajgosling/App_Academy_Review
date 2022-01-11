def hipsterfy(word)
    i = word.length - 1
    vowels = "aeiou"

    while i >= 0
        if vowels.include?(word[i].downcase)
            return word[0...i] + word[i + 1..-1]
        end
        i -= 1
    end

    return word
end

def vowel_counts(str)
    vowel_hash = Hash.new(0)
    vowels = "aeiou"

    str.each_char do |char|
        if vowels.include?(char.downcase)
            vowel_hash[char.downcase] += 1
        end
    end

    return vowel_hash
end

def caesar_cipher(message, n)
    alpha = ("a".."z").to_a
    new_str = ""

    message.each_char do |char|
        if alpha.include?(char)
            old_idx = alpha.index(char)
            new_idx = (old_idx + n) % 26
            new_str += alpha[new_idx]
        else
            new_str += char
        end
    end

    return new_str
end