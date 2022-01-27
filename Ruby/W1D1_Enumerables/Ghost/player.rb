class Player
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def guess(fragment)
    puts "the current word is: \"#{fragment}\""
    puts "guess a letter, #{@name}: "
    gets.chomp.downcase
  end

  def alert_invalid_guess(str)
    puts "#{str} is not a valid guess!"
    puts "you must guess a single character that leads to a real word."
  end
end