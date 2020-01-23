# require 'stack.rb'
class SmartStack < Stack
    attr_reader :max_size
    def initialize(max_size)
        @max_size = max_size
        @underlying_array = []
    end

    def full?
        @underlying_array.length == @max_size
    end

    def push(*args)
        if @underlying_array.length + args.length > @max_size
            raise "stack is full"
        end
        @underlying_array.concat(args)
        return @underlying_array.length
    end

    def pop(n = 1)
        return_arr = []
        n.times do
            return_arr << @underlying_array.pop
        end

        return_arr
    end

end