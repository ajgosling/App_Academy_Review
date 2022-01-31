require "./tile.rb"

class Board
  attr_reader :grid

  def Board.from_file(file_name)
    f = File.open(file_name)
    grid = f.readlines.map do |line|
      line.chomp.split("").map do |value|
        if value == "0"
          Tile.new(value)
        else
          Tile.new(value, true)
        end
      end
    end

    Board.new(grid)
  end

  def initialize(grid)
    unless grid.flatten.length == 81 && grid.flatten.all? {|el| el.is_a?(Tile)}
      raise "Improper Grid"
    end
    @grid = grid
  end

  def render
    @grid.each_with_index do |row, idx|
      puts "-----------------" if [3, 6].include?(idx)
      puts grid_lines(row.map(&:to_s))
    end
  end

  def grid_lines(arr)
    arr.join(" ")
  end

  def update(pos, value)
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, new_val)
    return false unless "0123456789".include?(new_val.to_s)
    row, col = pos
    @grid[row][col].value = new_val.to_s
  end


end



if __FILE__ == $PROGRAM_NAME
  b = Board.from_file("puzzles/sudoku1_solved.txt")
  r = Board.from_file("puzzles/sudoku1.txt")
  b.render
  puts
  r.render
  r[[0, 0]] = 4
  r.render
  p r[[0, 0]].class
end