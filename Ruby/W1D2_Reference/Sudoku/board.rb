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
    puts "   1 2 3 4 5 6 7 8 9"
    @grid.each_with_index do |row, idx|
      puts "   -----------------" if [0, 3, 6].include?(idx)
      puts "#{idx + 1} |" + grid_lines(row.map(&:to_s)) + "|"
    end
    puts "   -----------------"
  end

  def grid_lines(arr)
    p1 = arr[0..2].join(" ")
    p2 = arr[3..5].join(" ")
    p3 = arr[6..8].join(" ")
    "#{p1}|#{p2}|#{p3}"
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def update(pos, new_val)
    return false unless "0123456789".include?(new_val.to_s)
    row, col = pos
    @grid[row][col].value = new_val.to_s
  end

  def valid_unit?(arr)
    # takes in an arr of 9 tiles and returns whether it has all 9 digits
    row_vals = arr.map {|tile| tile.value}.uniq
    !row_vals.include?("0") && row_vals.length == 9
  end

  def row_solved?
    @grid.all? {|row| valid_unit?(row)}
  end

  def col_solved?
    @grid.transpose.all? {|row| valid_unit?(row)}
  end

  def box_solved?
    starts = [0, 3, 6]
    starts.each do |row|
      starts.each do |col|
        square_row = []
        (row...row + 3).each do |i|
          (col...col + 3).each do |j|
            square_row << self[[i, j]]
          end
        end
        return false unless valid_unit?(square_row)
      end
    end
    true
  end

  def solved?
    row_solved? && col_solved? && box_solved?
  end
end