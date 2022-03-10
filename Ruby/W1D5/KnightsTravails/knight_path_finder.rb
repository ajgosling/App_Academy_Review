require_relative "lib/00_tree_node.rb"

class KnightPathFinder
  def KnightPathFinder.valid_moves(pos)
    moves = [
      [1, 2],
      [1, -2],
      [-1, 2],
      [-1, -2],
      [2, 1],
      [2, -1],
      [-2, 1],
      [-2, -1]
    ]

    moves.map! {|move| [pos[0] + move[0], pos[1] + move[1]]}
    moves.select {|move| KnightPathFinder.valid_pos(move)}
  end

  def KnightPathFinder.valid_pos(pos)
    pos.all? {|num| num >= 0 && num <= 7}
  end

  attr_reader :root_node
  def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
    @considered_positions = [pos]
    build_move_tree
  end

  def new_move_positions(node)
    pos_arr = KnightPathFinder.valid_moves(node.value)
    pos_arr.reject! {|pos| @considered_positions.include?(pos)}
    @considered_positions += pos_arr
    pos_arr
  end

  def build_move_tree
    queue = [@root_node]
    until queue.empty?
      curr_node = queue.shift
      pos_arr = new_move_positions(curr_node)
      pos_arr.each do |pos|
        new_node = PolyTreeNode.new(pos)
        curr_node.add_child(new_node)
      end
      queue += curr_node.children
    end
    @root_node
  end

  def find_path(target_pos)
    curr_node = @root_node.dfs(target_pos)
    raise "invalid position entered" unless curr_node
    path_arr = []
    while curr_node
      path_arr.unshift(curr_node)
      curr_node = curr_node.parent
    end

    path_arr
  end

end

if __FILE__ == $PROGRAM_NAME
  k = KnightPathFinder.new([0,0])
  p k.find_path([5,5])
  p k.find_path([0,1])
end