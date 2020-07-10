class Stack
    def initialize
        @el_array = []
    end

    def push(el)
        @el_array << el
    end

    def pop
        @el_array.pop
    end

    def peek
        @el_array.last
    end
end

class Queue
    def initialize
        # create ivar to store stack here!
        @el_array = []
    end

    def enqueue(el)
        # adds an element to the stack
        @el_array << el
    end

    def dequeue
        @el_array.shift
    end

    def peek
        @el_array.first
    end
end

class Map
    def initialize
        @pairs_array = []
    end

    def set(key, val)
        @pairs_array.each do |pair|
            pair[1] = val if pair.first == key
            return val
        end

        @pairs_array << [key, val]
    end

    def get(key)
        @pairs_array.each do |pair|
            if pair.first == key
                return pair.last
            end
        end

        return nil
    end

    def delete(key)
        @pairs_array.each_with_index do |pair, idx|
            if pair.first == key
                @pairs_array.delete_at(idx)
                return key
            end
        end
        return nil
    end

    def show
        return @pairs_array
    end
end