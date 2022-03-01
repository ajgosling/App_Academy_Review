class PolyTreeNode
  attr_reader :value, :parent, :children
  def initialize(value, parent=nil)
    @value = value
    @parent = parent
    @children = []
  end

  def parent=(parent_node)
    # if we have a parent
    if parent_node
      # parent_node is real
      return nil if parent_node.include?(self)
      @parent = parent_node
      parent_node.add_child(self)
    end
  end

  def include?(node)
    @children.each_with_index do |child, i|
      return i if child == node
    end
    nil
  end

  def add_child(node)
    return nil if include?(node)
    @children << node
  end

  def delete_child(node)
    child_idx = include?(node)
    @children.delete_at(child_idx) if child_idx
  end
end
