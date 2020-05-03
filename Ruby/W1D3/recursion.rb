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

def fibonacci(n)
    return [0, 1].take(n) if n <= 2
    prev_fibs = fibonacci(n - 1)
    return prev_fibs << prev_fibs[-2] + prev_fibs[-1]
end

# p fibonacci(0)
# p fibonacci(1)
# p fibonacci(2)
# p fibonacci(3)
# p fibonacci(7)
# p fibonacci(25)

def fibonacci_iter(n)
    return [0, 1].take(n) if n <= 2
    fibs = [0, 1]
    until fibs.length == n
        fibs << fibs[-2] + fibs[-1]
    end
    return fibs
end

# p fibonacci(0)
# p fibonacci(1)
# p fibonacci(2)
# p fibonacci(3)
# p fibonacci(7)
# p fibonacci(25)

def bsearch(arr, target)
    return nil if arr.empty?
    mid_idx = arr.length / 2 # if length is 1, mid_idx == 0

    case arr[mid_idx] <=> target
    when -1
        # middle element less than target, search right half of array
        next_step = bsearch(arr[mid_idx + 1..-1], target)
        return next_step ? mid_idx + 1 + next_step : nil
    when 0
        # middle element matches target, return idx
        return mid_idx
    when 1
        # middle element greater than target, search left half
        return bsearch(arr[0...mid_idx], target)
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
# p bsearch([1, 2, 3, 4, 5, 7, 7, 8, 9], 7) # => nil

def merge_sort(arr)
    return arr if arr.length <= 1

    mid = arr.length / 2

    left_half = merge_sort(arr[0...mid])
    right_half = merge_sort(arr[mid..-1])

    return mergify(left_half, right_half)
end

def mergify(arr1, arr2)
    merged_arr = []

    until arr1.empty? || arr2.empty?
        arr1[0] < arr2[0] ? merged_arr << arr1.shift : merged_arr << arr2.shift
    end

    return merged_arr + arr1 + arr2
end

# p merge_sort([5, 3, 9, -1, 2, 4, 3])
# p merge_sort([])
# p merge_sort([3])
# p merge_sort([5, 4])