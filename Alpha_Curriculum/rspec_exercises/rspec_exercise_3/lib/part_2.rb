def element_count(arr)
  count_hash = Hash.new(0)
  arr.each {|el| count_hash[el] += 1}
  count_hash
end

def char_replace!(string, hash)
  string.each_char.with_index do |char, i|
    string[i] = hash[char] if hash.has_key?(char)
  end
end

def product_inject(arr)
  arr.inject {|acc, el| acc * el}
end