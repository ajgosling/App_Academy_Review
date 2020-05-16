class PolyTreeNode
    attr_accessor :value, :children
    attr_reader :parent
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def inspect
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
end

