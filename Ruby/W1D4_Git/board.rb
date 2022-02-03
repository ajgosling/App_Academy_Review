class Board
  def self.generate_random_grid
    grid = Array.new(9) {Array.new(9, "*")}
    Board.place_random_bombs(grid)
    grid
  end

  def self.place_random_bombs(grid)
    count = 0

    while count < 15
      # place a random ship on the grid
      rand_pos = [rand(grid.length), rand(grid.length)]

      if grid[rand_pos.first][rand_pos.last] == "*"
        grid[rand_pos.first][rand_pos.last] = "B"
        count += 1
      end
    end
    grid
  end

  attr_accessor :grid
  def initialize(grid=Board.generate_random_grid)
    @grid = grid
  end

  def display
    @grid.each do |row|
      puts row.join(" ")
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  p "hello"
  b = Board.new
  b.display
end