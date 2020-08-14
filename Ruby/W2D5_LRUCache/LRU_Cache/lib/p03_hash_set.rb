class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return if include?(key)

    @count += 1

    resize! if @count == num_buckets

    self[key.hash] << key
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    @count -= 1 if self[key.hash].delete(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) { Array.new }

    @store.flatten.each do |key|
      insert(key)
    end

    @store = new_store
  end
end
