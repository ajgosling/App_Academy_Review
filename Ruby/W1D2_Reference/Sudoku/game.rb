require_relative "board.rb"

class Game
  def initialize(file_name)
    @board = Board.from_file(file_name)
  end

  def play
    until @board.solved?
      system("clear")
      @board.render
      @board.update(*prompt)
    end
    system("clear")
    @board.render
    puts "WOW, YOU SOLVED IT"
  end

  def prompt
    puts "choose a position (3 numbers, format `row col val`)"
    res = gets.chomp.chars.select {|char| "0123456789".include?(char)}
    until res.length > 2
      puts "invalid input! type 3 numbers: `row column value`"
      res = gets.chomp.chars.select {|char| "0123456789".include?(char)}
    end
    [[res[0].to_i - 1, res[1].to_i - 1], res[2]]
  end
end

if __FILE__ == $PROGRAM_NAME
  g = Game.new("puzzles/sudoku1_almost.txt")
  g.play
end