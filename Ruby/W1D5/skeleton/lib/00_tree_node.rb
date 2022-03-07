class PolyTreeNode
  attr_reader :value, :parent, :children
  def initialize(value, parent=nil)
    @value = value
    @parent = parent
    @children = []
  end

  def dfs(val)
    return self if @value == val
    @children.each do |child|
      res = child.dfs(val)
      return res if res
    end

    nil
  end

  def bfs(val)
    queue = [self]

    until queue.empty?
      curr_node = queue.shift
      return curr_node if curr_node.value == val
      queue += curr_node.children
    end
    nil
  end

  def inspect
    @value
  end

  def parent=(parent_node)
    return if self.parent == parent_node

    if @parent
      @parent.children.delete(self)
    end

    @parent = parent_node
    if @parent
      @parent.children << self
    end

    self
  end

  def include?(node)
    @children.each_with_index do |child, idx|
      if node == child
        return idx
      end
    end
    return nil
  end

  def add_child(node)
    node.parent = self
  end

  def remove_child(node)
    raise "node is not a child" unless include?(node)
    node.parent = nil
  end

end

if __FILE__ == $PROGRAM_NAME
  n1 = PolyTreeNode.new("root1")
  n2 = PolyTreeNode.new("root2")
  n3 = PolyTreeNode.new("root3")

  # connect n3 to n1
  n3.parent = n1
  # connect n3 to n2
  n3.parent = n2

  # this should work
  raise "Bad parent=!" unless n3.parent == n2
  raise "Bad parent=!" unless n2.children == [n3]

  # this probably doesn't
  raise "Bad parent=!" unless n1.children == []

  p "no issues!"
end