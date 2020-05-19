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
    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
    end

    def find_path(end_pos)
    end

    def build_move_tree
        @considered_positions = [@root_node.value]
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

p KnightPathFinder.valid_moves([0, 4])

