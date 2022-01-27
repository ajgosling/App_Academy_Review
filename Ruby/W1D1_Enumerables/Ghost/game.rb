require "set"
require_relative "player.rb"
require "byebug"

class Game
  attr_reader :dictionary
  def initialize(*players)
    words = File.readlines("dictionary.txt").map(&:chomp)
    @dictionary = Set.new(words)
    @fragment = ""
    @players = players.map {|name| Player.new(name)}
    @losses_hash = {}
    @players.each {|player| @losses_hash[player] = 0}
  end

  def current_player
    @players.first
  end

  def previous_player
    @players.last
  end

  def next_player!
    @players.rotate!
  end

  def take_turn(player)
    until valid_play?(guess = player.guess(@fragment))
      player.alert_invalid_guess(guess)
    end
    @fragment += guess
  end

  def valid_play?(guess)
    return false unless guess.length == 1
    new_frag = @fragment + guess
    @dictionary.any? {|word| word.start_with?(new_frag)}
  end

  def lost?
    @dictionary.include?(@fragment)
  end

  def display_standings
    puts "-" * 40
    puts "-" * 40
    puts "the current standings are:"
    @losses_hash.each do |player, loss_count|
      puts "#{player.name}: #{"GHOST"[0...loss_count]}"
    end
    puts "-" * 40
    puts "-" * 40
  end

  def play_round
    until lost?
      take_turn(current_player)
      next_player!
    end
    puts "the losing word was \"#{@fragment}\""
    puts "#{previous_player.name} has lost this round"
    @losses_hash[previous_player] += 1
    if @losses_hash[previous_player] == 5
      puts "#{previous_player.name} has turned into a ghost!!!"
      @players.delete(previous_player)
    end
  end

  def run
    until @players.length == 1
      play_round
      display_standings
      @fragment = ""
    end
    puts "#{@players.first.name} is the big winner!!!"
    puts "thanks for playing!"
    true
  end
end

if __FILE__ == $PROGRAM_NAME
  g = Game.new("AJ", "Dan", "Katy")
  g.run
end