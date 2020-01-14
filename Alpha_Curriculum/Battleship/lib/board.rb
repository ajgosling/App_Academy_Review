class Board
	attr_accessor :grid

  def initialize(grid = Board.default_grid)
    @grid = grid
  end

  def self.default_grid
    return Array.new(10) {Array.new(10, nil)}
  end

  def [](pos)
    return @grid[pos.first][pos.last]
  end

	def []=(pos, new_val)
		@grid[pos.first][pos.last] = new_val
  end

  def display
    @grid.each do |row|
      print row
    end
    return true
  end

  def count
    total = 0
    @grid.each do |row|
        total += row.count(:s)
    end
    return total
	end

	def empty?(pos = nil)
		return self[pos].nil? if pos

		# if not explicitly passed pos, check whole board
		return self.count == 0
	end

	def full?
		@grid.flatten.none? {|el| el.nil?}
	end

	def won?
		@grid.flatten.none? {|el| el == :s}
	end

	def place_random_ship
		raise if self.full?
		coordinates = (0...@grid.length).to_a

		@grid[coordinates.sample][coordinates.sample] = :s
	end
end