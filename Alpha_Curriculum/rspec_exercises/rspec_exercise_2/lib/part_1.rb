def partition(arr, num)
    return_arr = [[], []]

    arr.each do |el|
        if el < num
            return_arr.first << el
        else
            return_arr.last << el
        end
    end

    return_arr
end

def merge(hash1, hash2)
    merged_hash = hash1.clone
    hash2.each {|k, v| merged_hash[k] = v}
    merged_hash
end

def censor_word(str)
    vowels = "aeiou"
    str.chars.map do |char|
        if vowels.include?(char.downcase)
            "*"
        else
            char
        end
    end.join
end

def censor(sent, arr)
    sent.split.map do |word|
        if arr.include?(word.downcase)
            censor_word(word)
        else
            word
        end
    end.join(" ")
end

def power_of_two?(num)
    power = 1

    while power <= num
        if power == num
            return true
        end
        power *= 2
    end

    false
end

def palindrome?(str)
    i = 0
    while i < str.length / 2
        return false if str[i] != str[-i - 1]
        i += 1
    end
    true
end

def substrings(str)
    subs_arr = []
    i = 0

    while i < str.length
        j = i
        while j < str.length
            subs_arr << str[i..j]
            j += 1
        end
        i += 1
    end

    subs_arr
end

def palindrome_substrings(str)
    subs = substrings(str)

    subs.select {|sub| sub.length > 1 && palindrome?(sub)}
end
