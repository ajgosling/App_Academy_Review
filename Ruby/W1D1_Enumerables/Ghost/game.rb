require "set"
require_relative "player.rb"
require "byebug"

class Game
  attr_reader :dictionary
  def initialize(p1_name, p2_name)
    words = File.readlines("dictionary.txt").map(&:chomp)
    @dictionary = Set.new(words)
    @players = [Player.new(p1_name), Player.new(p2_name)]
    @fragment = ""
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

  def play_round
    until lost?
      take_turn(current_player)
      next_player!
    end
    puts "the losing word was \"#{@fragment}\""
    puts "#{previous_player.name} is a big fat LOSER HAHAHAH"
    previous_player
  end
end

g = Game.new("AJ", "Dan")
g.play_round