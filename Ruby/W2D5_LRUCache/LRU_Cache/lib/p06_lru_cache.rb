require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map[key]
      node = @map[key]
      update_node!(node)
      node.val
    else
      # the key wasn't in our hashmap... we need to add it
      calc!(key)
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    val = @prc.call(key)
    eject! if @map.count == @max
    @map.set(key, val)
    @store.append(key, val)
    val
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    node.remove
    @map[node.key] = @store.append(node.key, node.val)
  end

  def eject!
    rm_node = @store.first
    rm_node.remove
    @map.delete(rm_node.key)
    nil
  end
end
