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
    i = 0
    subs = []
    while i < arr.length
        j = i

        while j < arr.length
            subs << arr[i..j]

            j += 1
        end

        i += 1
    end


    return (subs.max {|a, b| a.sum <=> b.sum}).sum

end

def largest_contig_sum2(arr)
    running_sum = 0
    max_sum = arr[0]

    arr.each do |num|
        running_sum += num

        if running_sum > max_sum
            max_sum = running_sum
        end

        if running_sum < 0
            running_sum = 0
        end
    end
end

arr = [5, 3, -7]
p largest_contiguous_subsum(arr)