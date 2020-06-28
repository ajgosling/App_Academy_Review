
def pair_sum(arr, target)
    # let's make a hash of numbers we've seen
    # everytime we encounter a NEW number
        # i'll check if the opposite of that number is in the hash (if my target is 19, and i have a 14, check 5)
    # if it IS in the hash, RETURN TRUE
    # if num is NOT in the hash, PUT IT in the hash

    numbers_seen_hash = Hash.new(false)

    arr.each_with_index do |num, idx| #
        if numbers_seen_hash[target - num] != false # if it's NOT FALSE, it must be the index of the match!

            # my numbers MATCH is already in the hash, return the idx of the match, and the current idx

            return [numbers_seen_hash[target - num], idx]
        else
            # my numbers match is NOT in the hash, lets put the number in the hash
            numbers_seen_hash[num] = idx
        end
    end

    return false

end



p pair_sum([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20], 39) # [18, 19]

p pair_sum([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20], 14) # [5, 7]

p pair_sum([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20], 100) # false




# {
#     # instead of storing "true", let's store the idx where we found the number
#     1: 0 # i found 1 at idx 0
#     2: 1 # i found 2 at idx 1
#     3: 2
#     4: 3


# }