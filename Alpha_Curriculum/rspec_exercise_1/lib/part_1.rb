def average(num1, num2)
    (num1 + num2).to_f / 2
end

def average_array(arr)
    arr.sum.to_f / arr.length
end

def repeat(str, num=1)
    str * num
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    str.split.map.with_index do |word, idx|
        if idx.even?
            word.upcase
        else
            word.downcase
        end
    end.join(" ")
end