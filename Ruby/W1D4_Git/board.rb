class Board
  def self.generate_random_grid
    grid = Array.new(9) {Array.new(9, "*")}
    Board.place_random_bombs(grid)
    grid
  end

  def self.place_random_bombs(grid)
    count = 0
    while count < 15
      # place a random bomb on the grid
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
      hidden_row = row.map {|el| el == "B" ? "*" : el}
      puts hidden_row.join(" ")
    end
  end

  def display_with_bombs
    @grid.each do |row|
      puts row.join(" ")
    end
  end

  def [](pos)
    @grid[pos.first][pos.last]
  end

  def []=(pos, val)
    @grid[pos.first][pos.last] = val
  end

  def reveal(pos)
    if self[pos] == "B"
      return false
    end

    new_pos_arr = dirs(pos)
    bomb_count = new_pos_arr.count {|pos| self[pos] == "B"}
    if bomb_count == 0
      self[pos] = " "
      new_pos_arr.each {|pos| reveal(pos) if self[pos] == "*"}
    else
      self[pos] = bomb_count.to_s
    end

    return true
  end

  def valid_pos(pos)
    return false unless pos.first >= 0 && pos.first < @grid.length
    pos.last >= 0 && pos.last < @grid.first.length
  end

  def dirs(pos)
    dirs = [[1,1],[1,-1],[1,0],[-1,1],[-1,-1],[-1,0],[0,1],[0,-1]]
    new_pos_arr = dirs.map {|dir| [pos[0] + dir[0], pos[1] + dir[1]]}
    new_pos_arr.select {|pos| valid_pos(pos)}
  end
end

if __FILE__ == $PROGRAM_NAME
  p "hello"
  b = Board.new
  b.reveal([5,5])
  b.display
end