# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def prime?(num)
    return false if num < 2
    (2...num).each {|fac| return false if num % fac == 0}
    true
end

def largest_prime_factor(num)
    i = num / 2

    return num if prime?(num)

    while i > 0
        return i if num % i == 0 && prime?(i)
        i -= 1
    end
end

def unique_chars?(str)
    str.chars.uniq.join.length == str.length
end

def dupe_indices(arr)
    hash = {}

    arr.each_with_index do |el, i|
        if hash.include?(el)
            hash[el] << i
        else
            hash[el] = [i]
        end
    end

    hash.select {|k, v| v.length > 1}
end

def ana_array(arr1, arr2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)

    arr1.each {|el| hash1[el] += 1}
    arr2.each {|el| hash2[el] += 1}

    hash1 == hash2
end