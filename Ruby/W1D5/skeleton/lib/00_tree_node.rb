class PolyTreeNode
  attr_reader :value, :parent, :children
  def initialize(value, parent=nil)
    @value = value
    @parent = parent
    @children = []
  end

  def parent=(parent_node)
    parent_node.add_child(self) if parent_node
    @parent.remove_child(self) if @parent
    @parent = parent_node

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
    @children << node unless include?(node)
  end

  def remove_child(node)
    @children.each_with_index do |child, idx|
      if node == child
        return @children.delete_at(idx)
      end
    end
    return nil
  end
end
