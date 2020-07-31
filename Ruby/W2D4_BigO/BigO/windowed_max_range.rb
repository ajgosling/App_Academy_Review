
def windowed_max_range(arr, window_size)
    curr_max_range = 0

    i = 0
    while i <= arr.length - window_size
        window_slice = arr[i...i + window_size]

        slice_max_range = window_slice.max - window_slice.min

        curr_max_range = slice_max_range if curr_max_range < slice_max_range

        i += 1
    end

    return curr_max_range
end



# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8


class MyQueue
  def initialize
    @store = []
  end

  def peek
    @store.first
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    @store.shift(el)
  end
end

class MyStack
  def initialize
    @store = []
    @max
  end


  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def pop
    @store.pop
  end

  def push(el)
    @store << el
  end
end

class StackQueue
    def initialize
        @enqueue_stack = MyStack.new
        @dequeue_stack = MyStack.new

    end

    def size
        @enqueue_stack.length + @dequeue_stack.length
    end

    def empty?
        self.size == 0
    end

    def enqueue(val)
        @enqueue_stack.push(val)
    end

    def dequeue
        if @dequeue_stack.empty?
            until @enqueue_stack.empty?
                @dequeue_stack.push(@enqueue_stack.pop)
            end
        end

        @dequeue_stack.pop
    end
end

# When you're ready, implement this StackQueue class with size, empty?, enqueue, and dequeue methods.


class MinMaxStack
    # Implement peek, size, empty?, max, min, pop, push methods on your MinMaxStack.

    def initialize
        @store = []
    end

    def peek
        @store.last
    end

    def size
        @store.size
    end

    def empty?
        @store.empty?
    end

    def push(val)

        if empty?
            @store << {
                min: val,
                max: val,
                value: val
            }
        else
            @store << {
                min: curr_min(val),
                max: curr_max(val),
                value: val
            }

        end
    end

    def pop
        empty? ? nil : @store.pop[:value]
    end

    def curr_min(val)
        [peek[:min], val].min
    end

    def curr_max(val)
        [peek[:max], val].max
    end
end

class MinMaxStackQueue
    def initialize
        @in_stack = MinMaxStack.new
        @out_stack = MinMaxStack.new
    end

    def size
        @in_stack.size + @out_stack.size
    end

    def empty?
        self.size == 0
    end

    def enqueue(val)
        @in_stack.push(val)
    end

    def dequeue
        if @out_stack.empty?
            until @in_stack.empty?
                @out_stack.push(@in_stack.pop)
            end
        end


        @out_stack.pop
    end

    def max
        [@in_stack.max, @out_stack.max].max
    end

    def max
        maxes = []
        maxes << @in_stack.max unless @in_stack.empty?
        maxes << @out_stack.max unless @out_stack.empty?
        return maxes.max
    end

    def min
        mins = []
        mins << @in_stack.min unless @in_stack.empty?
        mins << @out_stack.min unless @out_stack.empty?
        return mins.min
    end
end