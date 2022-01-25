class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(3) {Array.new(3, "_")}
  end

  def [](pos)
    @grid[pos.first][pos.last]
  end

  def []=(pos, mark)
    @grid[pos.first][pos.last] = mark
  end

  def valid?(pos)
    return false unless pos.length == 2
    pos.all? {|num| num <= 2 && num >= 0}
  end

  def empty?(pos)
    self[pos] == "_"
  end

  def place_mark(pos, mark)
    raise "invalid mark" unless valid?(pos) && empty?(pos)
    self[pos] = mark
  end

  def print
    @grid.each {|row| puts row.join(" ")}
  end

  def win_row?(mark)
    @grid.any? do |row|
      row.all? {|el| mark == el}
    end
  end

  def win_col?(mark)
    @grid.transpose.any? do |row|
      row.all? {|el| mark == el}
    end
  end

  def win_diag?(mark)
    return true if (0..2).all? {|i| self[[i, i]] == mark}
    (0..2).all? {|i| self[[i, 2 - i]] == mark}
  end

  def win?(mark)
    win_row?(mark) || win_col?(mark) || win_diag?(mark)
  end

  def empty_positions?
    @grid.flatten.include?("_")
  end
end