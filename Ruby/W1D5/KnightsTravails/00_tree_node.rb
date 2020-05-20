class PolyTreeNode
    attr_accessor :value, :children
    attr_reader :parent
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def inspect
        # {value: @value, children: @children}
        @value
    end

    def parent=(node)
        if @parent
            @parent.children.delete(self)
        end
        if node.nil?
            unless @parent.nil?
                @parent = nil
            end
        else
            @parent = node
            node.add_child(self)
        end
    end

    def add_child(node)
        @children << node unless @children.include?(node)
        node.parent = self if node.parent != self
    end

    def remove_child(node)
        if @children.include?(node)
            @children.delete(node)
            node.parent = nil
        else
            raise "node not child"
        end
    end

    def dfs(target)
        return self if @value == target
        @children.each do |child|
            child_result = child.dfs(target)
            return child_result if child_result
        end
        return nil
    end

    def bfs(target)
        queue = [self]

        until queue.empty?
            new_node = queue.shift
            return new_node if new_node.value == target
            queue += new_node.children
        end

        return nil
    end
end

