class StaticArray
  attr_reader :store

  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    self.store[i]
  end

  def []=(i, val)
    validate!(i)
    self.store[i] = val
  end

  def length
    self.store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, self.store.length - 1)
  end
end

class DynamicArray
  attr_accessor :count

  include Enumerable

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    return nil if i > @count - 1 || i < -@count
    return @store[@count + i] if i < 0
    return @store[i]
  end

  def []=(i, val)
    raise "index too small" if i < -@count
    return @store[@count + i] = val if i < 0
    return @store[i] = val if i < @count
    # if count is 4 and i is 6, need i4 = nil and i5 = nil (i6 = val)
    (i - @count).times {self.push(nil)}
    self.push(val)
    return val
  end

  def capacity
    @store.length
  end

  def include?(val)
    any? {|el| el == val}
  end

  def push(val)
    resize! if @count == capacity

    @store[@count] = val
    @count += 1

    @store
  end

  def unshift(val)
    resize! if @count == capacity

    @count.times do |time|
      @store[@count - time] = @store[@count - time - 1]
    end

    @count += 1
    @store[0] = val
  end

  def pop
    return nil if @count == 0
    @count -= 1
    val = @store[@count]
    @store[@count] = nil
    return val
  end

  def shift
    return nil if @count == 0

    @count -= 1

    val = @store[0]
    @count.times do |time|
      @store[time] = @store[time + 1]
    end

    @store[@count] = nil

    val
  end

  def first
    @store[0]
  end

  def last
    @store[@count - 1]
  end

  def each
    i = 0
    while i < @count
      yield @store[i]
      i += 1
    end
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    return false unless self.length == other.length
    each_with_index do |el, i|
      return false unless el == other[i]
    end
    true
  end


  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    new_store = StaticArray.new(capacity * 2)
    each_with_index do |el, i|
      new_store[i] = el
    end

    @store = new_store
  end
end