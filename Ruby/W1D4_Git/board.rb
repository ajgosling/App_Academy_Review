require_relative "tile.rb"
require "byebug"

class Board
  def self.generate_random_board
    new_board = Board.new(Array.new(9) {Array.new(9) {Tile.new}})
    Board.place_random_bombs(new_board)
    new_board
  end

  def self.place_random_bombs(board)
    count = 0
    while count < 10
      # place a random bomb on the grid
      size = board.size_arr
      rand_pos = [rand(size.first), rand(size.last)]

      unless board[rand_pos].bomb?
        board[rand_pos].bombify
        count += 1
      end
    end
    board
  end

  attr_accessor :grid
  def initialize(grid)
    @grid = grid
  end

  def display
    puts "  #{(1..size_arr.last).to_a.join(" ")}"
    @grid.each_with_index do |row, i|
      puts "#{i + 1} #{row.join(" ")}"
    end
  end

  def size_arr
    [@grid.length, @grid.first.length]
  end

  def [](pos)
    @grid[pos.first][pos.last]
  end

  def flag(pos)
    self[pos].flag
  end

  def reveal(pos)
    return if self[pos].flagged?
    if self[pos].bomb?
      return false
    end

    new_pos_arr = dirs(pos)
    bomb_count = new_pos_arr.count {|pos| self[pos].bomb?}
    self[pos].explore(bomb_count.to_s)
    if bomb_count == 0
      new_pos_arr.each {|pos| reveal(pos) unless self[pos].explored?}
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

  def clarify_user_input(arr)
    command = user_input[0]
    return false unless "fr".include?(command)
    user_input.select! {|char| "0123456789,".include?(char)}
    pos_arr = user_input.join.split(",")
    p pos_arr
  end

  def get_user_input
    puts "enter `f` or `r` plus a position e.g. `f 3,4`"
    user_input = clarify_user_input(gets.chomp.chars)

  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.generate_random_board
  b.reveal([5,5])
  b.display
  # debugger
  p b.get_user_input
end