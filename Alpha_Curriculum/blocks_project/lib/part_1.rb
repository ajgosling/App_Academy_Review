def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(arr)
    arr.reject {|dog| dog["age"] < 3}
end

def count_positive_subarrays(matrix)
    matrix.count {|arr| arr.sum > 0}
end

def aba_translate(word)
    vowels = "aeiouAEIOU"

    word.chars.map do |char|
        if vowels.include?(char)
            char + "b" + char.downcase
        else
            char
        end
    end.join("")
end

def aba_array(arr)
    arr.map {|word| aba_translate(word)}
end