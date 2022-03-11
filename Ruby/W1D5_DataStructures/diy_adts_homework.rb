class Stack
  def initialize
    @list = []
  end

  def push(el)
    @list << el
  end

  def pop
    @list.pop
  end

  def peek
    @list.last
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue.first
  end
end

class Map
  def initialize
    @map_array = []
  end

  def set(key, val)
    @map_array.each do |pair|
      if pair.first == key
        return pair[1] = val
      end
    end
    @map_array << [key, val]
  end

  def get(key)
    @map_array.each do |pair|
      return pair.last if pair.first == key
    end
    nil
  end

  def show
    p @map_array
  end

  def delete(key)
    @map_array.each_with_index do |pair, i|
      if pair.first == key
        @map_array.delete_at(i)
      end
    end
  end
end