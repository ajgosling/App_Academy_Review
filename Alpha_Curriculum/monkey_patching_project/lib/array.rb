# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?
        min = self.first
        max = self.first
        self.each do |el|
            min = el if min > el
            max = el if max < el
        end
        max - min
    end

    def average
        return nil if self.empty?
        if self.all? {|num| num.is_a?(Integer)}
            self.sum.to_f / self.length
        end
    end

    def median
        return nil if self.empty?
        sorted = self.sort
        m = sorted.length / 2
        if sorted.length.even?
            (sorted[m - 1] + sorted[m]).to_f / 2
        else
            sorted[m]
        end
    end

    def counts
        count_hash = Hash.new(0)

        self.each {|el| count_hash[el] += 1}

        count_hash
    end

    def my_count(item)
        count = 0
        self.each {|el| count += 1 if item == el}
        count
    end

    def my_index(item)
        self.each_with_index {|el, i| return i if el == item}
        nil
    end

    def my_uniq
        uniq_hash = {}
        self.each {|el| uniq_hash[el] = true}
        uniq_hash.keys
    end

    def my_transpose
        return_arr = Array.new(self.first.length) {[]}
        self.each do |sub_arr|
            sub_arr.each_with_index do |el, i|
                return_arr[i] << el
            end
        end

        return_arr
    end
end