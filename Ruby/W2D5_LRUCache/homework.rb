class LRUCache
    def initialize(size=4)
        @store = Array.new(size)
    end

    def count
        # returns number of elements currently in cache
        @store.length
    end

    def add(el)
        # adds element to cache according to LRU principle
        # first item will be most recently added
        el_idx = @store.index(el)

        if el_idx
        # el was already in cache
            @store.unshift(@store.delete_at(el_idx))
        else
            @store.pop
            @store.unshift(el)
        end

        el
    end

    def show
        # shows the items in the cache, with the LRU item first
        p @store
    end

    private
    # helper methods go here!

end

johnny_cache = LRUCache.new(4)

p johnny_cache.add("I walk the line")
p johnny_cache.add(5)

p johnny_cache.count # => returns 2

p johnny_cache.add([1,2,3])
p johnny_cache.add(5)
p johnny_cache.add(-5)
p johnny_cache.add({a: 1, b: 2, c: 3})
p johnny_cache.add([1,2,3,4])
p johnny_cache.add("I walk the line")
p johnny_cache.add(:ring_of_fire)
p johnny_cache.add("I walk the line")
p johnny_cache.add({a: 1, b: 2, c: 3})


 johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]