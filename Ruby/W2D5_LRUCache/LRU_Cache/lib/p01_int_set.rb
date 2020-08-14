class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max + 1, false)
  end
# Each index in the @store will correspond to an item, and the value at that index will correspond to its presence (either true or false)
# e.g., the set { 0, 2, 3 } will be stored as: [true, false, true, true]
# The size of the array will remain constant!
# The MaxIntSet should raise an error if someone tries to insert, remove, or check inclusion of a number that is out of bounds.
  def insert(num)
    raise "outside range" unless is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    raise "outside range" unless is_valid?(num)
    @store[num] = false
  end

  def include?(num)
    raise "outside range" unless is_valid?(num)

    @store[num]
  end

  private

  def is_valid?(num)
    num >= 0 && num <= @max
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num unless self.include?(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end




# class ResizingIntSet
#   attr_reader :count

#   def initialize(num_buckets = 20)
#     @store = Array.new(num_buckets) { Array.new }
#     @count = 0
#   end

#   def insert(num)
#   end

#   def remove(num)
#   end

#   def include?(num)
#   end

#   private

#   def [](num)
#     # optional but useful; return the bucket corresponding to `num`
#   end

#   def num_buckets
#     @store.length
#   end

#   def resize!
#   end
# end
