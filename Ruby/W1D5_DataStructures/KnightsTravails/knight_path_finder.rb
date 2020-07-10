require_relative '00_tree_node'

POS_CHANGES = [
    [2, 1],
    [2, -1],
    [-2, 1],
    [-2, -1],
    [1, 2],
    [1, -2],
    [-1, 2],
    [-1, -2]
]

class KnightPathFinder
    attr_reader :root_node

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        build_move_tree
    end

    def find_path(end_pos)
        return nil unless end_pos.all? {|pos| pos >= 0 && pos <= 7}

        queue = [@root_node]

        until queue.empty?
            curr_node = queue.shift
            return trace_back_path(curr_node) if curr_node.value == end_pos
            queue += curr_node.children
        end

        return nil
    end

    def trace_back_path(node)
        value_list = []
        until node.nil?
            value_list.unshift(node.value)
            node = node.parent
        end

        return value_list
    end

    def build_move_tree
        @considered_positions = [@root_node.value]
        queue = [@root_node]
        until queue.empty?
            next_node = queue.shift
            new_moves = new_move_positions(next_node.value)
            new_moves.each do |move|
                # make a polytreenode with move as pos
                new_child = PolyTreeNode.new(move)
                next_node.add_child(new_child)
                queue << new_child
            end
        end

        return @root_node

    end

    def new_move_positions(pos)
        possible_moves = KnightPathFinder.valid_moves(pos)

        new_moves = possible_moves.reject do |move|
            @considered_positions.include?(move)
        end

        @considered_positions += new_moves
        return new_moves
    end

    def self.valid_moves(pos)
        valid_moves_arr = []
        POS_CHANGES.each do |dir|
            new_pos = [pos[0] + dir[0], pos[1] + dir[1]]
            valid_moves_arr << new_pos if new_pos.all? {|val| val>=0 && val<=7}
        end
        return valid_moves_arr
    end
end

kpf = KnightPathFinder.new([0,0])

p kpf.find_path([7, 6])