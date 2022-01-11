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