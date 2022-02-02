#Problem 1:

def sum_recur(array)
  return array.first if array.length < 2
  array.first + sum_recur(array[1..-1])
end

# p sum_recur([1, 2, 3, 4, 5, 6]) # 21

#Problem 2:

def includes?(array, target)
  return false if array.length == 0
  return true if array.first == target
  includes?(array[1..-1], target)
end

# p includes?([1, 2, 3, 4, 5, 6], 3) # true
# p includes?([1, 2, 3, 4, 5, 6], 7) # false

# Problem 3:

def num_occur(array, target)
  return 0 if array.empty?
  array.first == target ? count = 1 : count = 0
  count + num_occur(array[1..-1], target)
end

# p num_occur("asldkalafa".split(""), "a") # 4

# Problem 4:

def add_to_twelve?(array)
  return false if array.length < 2
  return true if array[0] + array[1] == 12
  add_to_twelve?(array[1..-1])
end

# p add_to_twelve?([4, 6, 5, 2, 10, 3]) # true
# p add_to_twelve?([4, 6, 5, 2, 11, 3]) # false

# Problem 5:

def sorted?(array)
  return true if array.length < 2
  return false if array[0] > array[1]
  sorted?(array[1..-1])
end

# Problem 6:

def reverse(string)
  return string if string.length < 2
  string[-1] + reverse(string[0..-2])
end

# p reverse("hello")