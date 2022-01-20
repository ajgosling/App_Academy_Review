class Board
  attr_reader :size
  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n ** 2
    @row_length = n
  end

  def [](pos)
    @grid[pos.first][pos.last]
  end

  def []=(pos, val)
    @grid[pos.first][pos.last] = val
  end

  def num_ships
    @grid.sum {|row| row.count(:S)}
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      p "you sunk my battleship!"
      true
    else
      self[pos] = :X
      false
    end
  end

  def place_random_ships
    count = 0
    sufficient = @size / 4

    while count < sufficient
      # place a random ship on the grid
      rand_pos = [rand(@row_length), rand(@row_length)]

      if self[rand_pos] == :N
        self[rand_pos] = :S
        count += 1
      end
    end
  end

  def hidden_ships_grid
    # should iterate over real grid and replace S with N
    @grid.map {|row| row.map {|el| el == :S ? :N : el}}
  end

  def self.print_grid(grid)
    grid.each {|row| puts row.join(" ")}
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end
