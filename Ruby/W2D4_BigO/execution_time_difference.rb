def my_min(arr)
    arr.each do |el1|
        return el1 if arr.none? {|el2| el2 < el1}
    end
end

# p my_min([0, 3, 5, 4, -5, 10, 1, 90])
# this is O of n squared

def my_min_improved(arr)
    min = arr[0]

    arr.each do |el|
        min = el if el < min
    end

    return min
end

# p my_min_improved([0, 3, 5, 4, -5, 10, 1, 90])
# this is O of n

def largest_contiguous_subsum(arr)
end

list = [5, 3, -7]
largest_contiguous_subsum(list) # => 8

# possible sub-sums
[5]           # => 5
[5, 3]        # => 8 --> we want this one
[5, 3, -7]    # => 1
[3]           # => 3
[3, -7]       # => -4
[-7]          # => -7