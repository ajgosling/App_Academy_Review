class Board
  def self.generate_random_grid
    Array.new(9) {Array.new(9, "*")}
  end

  def initialize(grid)
    @grid = Board.generate_random_grid
  end
end