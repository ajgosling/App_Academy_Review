def exp(base, power)
  return 1 if power == 0
  return base if power == 1
  return exp(base, power / 2) ** 2 if power.even?
  base * exp(base, (power - 1) / 2) ** 2
end

# p exp(3, 0)
# p exp(3, 1)
# p exp(3, 2)
# p exp(3, 3)
# p exp(3, 4)
# p exp(3, 5)
# p exp(3, 6)

class Array
  def deep_dup
    new_arr = []
    self.each do |el|
      el.is_a?(Array) ? new_arr << el.deep_dup : new_arr << el
    end
    new_arr
  end
end

def fib_recursive(n)
  return 0 if n == 1
  return 1 if n == 2
  fib_recursive(n - 2) + fib_recursive(n - 1)
end

def fib_iterative(n)
  return 0 if n == 1
  return 1 if n == 2
  first = 0
  last = 1
  count = 2
  while count < n
    first, last, count = last, first + last, count + 1
  end
  last
end

# p fib_recursive(1)
# p fib_recursive(2)
# p fib_recursive(3)
# p fib_recursive(4)
# p fib_recursive(5)
# p fib_recursive(6)

def bsearch(arr, target)
  return nil if arr.empty?
  return 0 if arr.first == target

  midpoint = arr.length / 2
  case target <=> arr[midpoint]
  when -1
    # item is in left half of arr
    bsearch(arr[0...midpoint], target)
  when 0
    midpoint
  when 1
    # find el in right half if arr
    # add midpoint + 1 + res
    res = bsearch(arr[midpoint + 1..-1], target)
    res.nil? ? nil : midpoint + 1 + res
  end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge(arr1, arr2)
  merged_arr = []
  until arr1.empty? || arr2.empty?
    if arr1.first < arr2.first
      merged_arr << arr1.shift
    else
      merged_arr << arr2.shift
    end
  end
  merged_arr + arr1 + arr2
end

def merge_sort(arr)
  return arr if arr.length < 2
  midpoint = arr.length / 2
  merge(merge_sort(arr[0...midpoint]), merge_sort(arr[midpoint..-1]))
end

# p merge_sort([38, 27, 43, 3, 9, 82, 10])

def subsets(arr)
  return [[]] if arr.empty?

  prev_subsets = subsets(arr[0..-2])
  prev_subsets + prev_subsets.map {|sub| sub + [arr.last]}
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def permutations(arr)
  return [[]] if arr.empty?
  prev_perms = permutations(arr[0..-2])
  new_perms = []
  new_el = arr.last
  prev_perms.each do |perm|
    new_perms += perm_slice(perm, new_el)
  end
  new_perms
end

def perm_slice(arr, new_el) # [1, 2, 3], 4
  (0..arr.length).map do |time|
    arr[0...time] + [new_el] + arr[time..-1]
  end
end

# p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
#                         #     [2, 1, 3], [2, 3, 1],
#                         #     [3, 1, 2], [3, 2, 1]]

def greedy_make_change(amt, coins_arr)
  result_arr = []
  coins_arr.each do |coin|
    while amt >= coin
      result_arr << coin
      amt -= coin
    end
  end
  result_arr
end

def make_better_change(amt, coins_arr)
  return [] if amt == 0
  return [nil] if amt < coins_arr.last

  coin_results_arr = []
  coins_arr.each_with_index do |coin, idx|
    next if coin > amt
    coin_results_arr << [coin] + make_better_change(amt - coin, coins_arr[idx..-1])
  end

  coin_results_arr.delete(nil)
  return nil if coin_results_arr.empty?
  coin_results_arr.sort {|arr1, arr2| arr1.length <=> arr2.length}.first


end

# p greedy_make_change(24, [10, 7, 1])
# p make_better_change(24, [10, 7, 1])
p make_better_change(23, [10, 7])

# try to make the change return nil if there is no possible way to make proper change
# while still returning the correct answer if there is a way