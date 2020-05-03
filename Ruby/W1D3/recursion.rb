def range(start_num, end_num)
    return [] if start_num >= end_num

    return [start_num] + range(start_num + 1, end_num)
end

# p range(1, 5) # [1, 2, 3, 4]
# p range(6, 6) # []
# p range(7, 6) # []
# p range(1, 2) # [1]

# this is math, not Ruby methods.

# recursion 1
def exp1(base, power)
    return 1 if power == 0
    return base * exp1(base, power - 1)
end

# p exp1(5, 0) #= 1
# p exp1(5, 2) #= 25
# p exp1(5, 5) #= b * exp(b, n - 1)

# recursion 2
def exp2(base, power)
    return 1 if power == 0
    return base if power == 1
    return exp(base, power / 2) ** 2 if power.even?
    return base * ((exp(base, (power - 1) / 2)) ** 2)
end

# p exp1(5, 0) #= 1
# p exp1(5, 2) #= 25
# p exp1(5, 5) #= b * exp(b, n - 1)

def deep_dup(arr)
    dupped_arr = []
    arr.each do |el|
        if !el.is_a?(Array)
            dupped_arr << el
        else
            dupped_arr << deep_dup(el)
        end
    end
    return dupped_arr
end

# arr1 = [1, [2], [3, [4]]]
# arr2 = deep_dup([1, [2], [3, [4]]])
# arr2[1] << "hello!"
# p arr1
# p arr2