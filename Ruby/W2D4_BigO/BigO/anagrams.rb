def first_anagram?(s1, s2)
    # generate all possible anagrams of s1

    s1_perms = s1.split("").permutation.to_a

    s2_split = s2.split("")

    return s1_perms.any? {|perm| s2_split == perm}
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

# time complexity: O of n factorial

def second_anagram?(s1, s2)
    s2_arr = s2.chars
    s1.each_char do |char|
        idx = s2_arr.find_index(char)

        return false unless idx

        s2_arr.delete_at(idx)
    end

    return s2_arr.empty?
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

# time complexity: m x n

def third_anagram?(s1, s2)
    return s1.chars.sort == s2.chars.sort
end

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

# time complexity: n log n

def fourth_anagram?(s1, s2)
    s1_hash = Hash.new(0)

    s1.each_char do |char|
        s1_hash[char] += 1
    end

    s2.each_char do |char|
        s1_hash[char] -= 1
    end

    s1_hash.all? {|k, v| v == 0}
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true

# time complexity: n + m
