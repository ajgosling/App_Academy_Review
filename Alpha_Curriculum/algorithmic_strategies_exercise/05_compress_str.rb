# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    # loop until done with string
    # take current (first char)
    # inside loop until char no longer matches (tracking count)
    # once we find unmatching char, add string we had and update curr_char

    return_str = ""
    i = 0

    while i < str.length
        count = 1
        while str[i] == str[i + 1]

            i += 1
            count += 1
        end

        if count > 1
            return_str += count.to_s + str[i]
        else
            return_str += str[i]
        end

        i += 1
    end

    return_str
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"