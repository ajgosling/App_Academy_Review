# Given an array of unique integers ordered from least to greatest, write a
# method that returns an array of the integers that are needed to
# fill in the consecutive set.

def missing_numbers(nums)
  missing_arr = []

  i = 1
  curr = nums.first + 1

  while i < nums.length
    until curr == nums[i]
      missing_arr << curr
      curr += 1
    end
    i += 1
    curr += 1
  end

  return missing_arr

end

# Write a method that returns the nth prime number
def nth_prime(n)
  return nil if n == 0

  prime_arr = []
  check = 2
  while prime_arr.length != n
    if is_prime?(check)
      prime_arr << check
    end

    check += 1
  end

  return prime_arr.last
end

def is_prime?(num)
  return false if num < 2

  i = 2
  (2..num ** 0.5).none? {|fac| num % fac == 0}
end

class Hash
  # Hash#select passes each key-value pair of a hash to the block (the proc
  # accepts two arguments: a key and a value). Key-value pairs that return true
  # when passed to the block are added to a new hash. Key-value pairs that return
  # false are not. Hash#select then returns the new hash.
  #
  # Write your own Hash#select method by monkey patching the Hash class. Your
  # Hash#my_select method should have the functionailty of Hash#select described
  # above. Do not use Hash#select in your method.

  def my_select(&prc)
    new_hash = {}

    self.each do |el|
      if prc.call(el[0], el[1])
        new_hash[el[0]] = el[1]
      end
    end

    return new_hash
  end
end

# A palindrome is a word or sequence of words that reads the same backwards as
# forwards. Write a method that returns the length of the longest palindrome in
# a given string. If there is no palindrome longer than two letters, return false.

def longest_palindrome(string)
  i = 0
  longest = ""
  while i < string.length
    j = i
    while j < string.length
      substr = string[i..j]
      if substr == substr.reverse && substr.length > longest.length
        longest = substr
      end
      j += 1
    end
    i += 1
  end
  return false if longest.length < 3
  return longest.length
end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)

    i = 0


    while i < self.length

      prc.call(self[i])
      i += 1
    end

    return self

  end
end

class Array
  # Write an Array method that returns a bubble-sorted copy of an array.
  # Do NOT call the built-in Array#sort method in your implementation.
  def bubble_sort(&prc)

    if prc.nil?
      prc = Proc.new {|el1, el2| el1 <=> el2}
    end
    duplicated = self.dup

    sorted = false

    until sorted
      sorted = true


      i = 1
      while i < duplicated.length
        if prc.call(duplicated[i - 1], duplicated[i]) == 1
        # if duplicated[i - 1] > duplicated[i]
          duplicated[i - 1], duplicated[i] = duplicated[i], duplicated[i - 1]
          sorted = false
        end

        i += 1
      end
    end

    return duplicated
  end

  # You are not required to implement this; it's here as a suggestion :-)
  def bubble_sort!(&prc)
    # if prc.nil?
    #   prc = Proc.new {|el1, el2| el1 > el2}
    # end

    sorted = false

    until sorted
      sorted = true


      i = 1
      while i < self.length
        unless prc.call(self[i - 1], self[i])
        # if self[i - 1] > self[i]
          self[i - 1], self[i] = self[i], self[i - 1]
          sorted = false
        end

        i += 1
      end
    end

    return self
  end
end

# The following is a skeleton of three classes you will be asked to define to
# pass the related specs. Please read the specs carefully to determine the
# functionality and instance variables you should give each class. Show us your
# object-oriented programming skills!

class Cat

  attr_accessor :happy
  def initialize(name)
    @name = name
    @happy = false
  end

  def receive_love
    @happy = true
    self.meow
  end
  def meow
    return "meow"
  end

  def name
    return @name
  end
end

class Dog
  attr_accessor :breed, :name

  BREEDS = ['Husky', 'Black Labrador', 'German Shepherd', 'Chihuahua']

  def initialize(name, breed = BREEDS.sample)
    @name = name
    @breed = breed
  end

  def play_with(thing)
    thing.receive_love
  end

  def self.make_a_pup(name = "hi")
    return Dog.new(name)
  end
end

class Human
  attr_accessor :happy

  def initialize(name)
    @name = name
    @happy = false
  end

  def happy?
    return @happy
  end

  def receive_love
    @happy = true
  end
end
