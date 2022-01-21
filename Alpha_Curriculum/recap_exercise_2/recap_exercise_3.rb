def no_dupes?(arr)
  dupe_hash = Hash.new(0)

  arr.each {|el| dupe_hash[el] += 1}

  dupe_hash.keys.select {|k| dupe_hash[k] == 1}
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
  i = 0
  while i < arr.length - 1
    return false if arr[i] == arr[i + 1]
    i += 1
  end
  true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
  char_hash = Hash.new {|h, k| char_hash[k] = []}
  str.each_char.with_index {|c, i| char_hash[c] += [i]}
  char_hash
end

# p char_indices('mississippi')
# => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')
# => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
  i = 0
  best = ""

  while i < str.length
    # iterate for the curr char
    curr = ""
    curr_char = str[i]
    while str[i] == curr_char
      curr += curr_char
      i += 1
    end

    best = curr if curr.length >= best.length
  end

  best
end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def prime?(num)
  return false if num < 2
  (2...num / 2).each do |i|
    return false if num % i == 0
  end
  true
end

def bi_prime?(num)
  (2...num / 2).each do |i|
    return true if num % i == 0 && prime?(i) && prime?(num / i)
  end
  false
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(msg, keys)
  alpha = ("a".."z").to_a
  new_msg = ""

  msg.each_char.with_index do |char, i|
    old_idx = alpha.index(char)
    new_idx = (old_idx + keys[i % keys.length]) % 26
    new_msg += alpha[new_idx]
  end
  new_msg
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def first_vowel(str)
  str.each_char.with_index do |char, i|
    return i if "aeiou".include?(char.downcase)
  end
  false
end
def vowel_rotate(str)
  first_vowel_idx = first_vowel(str)
  curr_vowel = str[first_vowel_idx]
  vowels = "aeiou"
  str.each_char.with_index do |char, i|
    if vowels.include?(char)
      curr_vowel, str[i] = str[i], curr_vowel
    end
  end
  str[first_vowel_idx] = curr_vowel
  str
end

# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

class String
  def select(&prc)
    return "" unless prc
    new_str = ""
    self.each_char {|c| new_str += c if prc.call(c)}
    new_str
  end

  def map!(&prc)
    self.each_char.with_index {|c, i| self[i] = prc.call(c, i)}
  end
end

p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""


# word_1 = "Lovelace"
# word_1.map! do |ch|
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"
# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

def multiply(num1, num2)
  return 0 if num1 == 0 || num2 == 0
  return num2 if num1 == 1
  return 0 - multiply(num1.abs, num2) if num1 < 0
  num2 + multiply(num1 - 1, num2)
end

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(n)
  lucas_arr = [2, 1]
  return lucas_arr[0...n] if n < 3
  prev_arr = lucas_sequence(n - 1)
  prev_arr << prev_arr[-2] + prev_arr[-1]
  prev_arr
end

p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]