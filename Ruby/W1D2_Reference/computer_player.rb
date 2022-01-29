class ComputerPlayer
  def ComputerPlayer.generate_pos_arr
    # create array of all positions from [0, 0] to [2, 3]
    pos_arr = []
    3.times {|i| 4.times {|j| pos_arr << [i, j]}}
    pos_arr
  end

  attr_accessor :known_cards, :unknown_pos_arr, :prev_guess_pos
  def initialize
    @known_cards = Hash.new {|h, k| h[k] = []}
    @unknown_pos_arr = ComputerPlayer.generate_pos_arr
    @prev_guess_pos = nil
  end

  def known_match
    # if we know a match, return the first item, else return nil
    @known_cards.each do |val, pos_arr|
      if pos_arr.length > 1
        return pos_arr.last
      end
    end
    # no known match
    nil
  end

  def check_prev_guess_for_new_match
    @known_cards.each do |val, pos_arr|
      if pos_arr.include?(@prev_guess_pos)
        # we've found the val that was previously guessed
        # if there is a different pos with the same val, return it
        pos_arr.each {|pos| return pos if pos != @prev_guess_pos}
      end
    end
    # no known match
    nil
  end

  def prompt
    sleep(0.5)
    unless @prev_guess_pos
      # this is our first guess, first check if we know a match
      match = known_match
      if match
        @prev_guess_pos = match
        return match
      end
      # we do not have a match, guess the first new position
      @prev_guess_pos = @unknown_pos_arr.shift
      return @prev_guess_pos
    else
      # this is our second guess, check if first guess has a match
      match = check_prev_guess_for_new_match
      @prev_guess_pos = nil
      if match
        return match
      end
      # if we do not have a match, guess first new position
      @unknown_pos_arr.shift
    end
  end

  def take_break
    sleep(1)
  end

  def receive_revealed_card(card, pos)
    @known_cards[card.value] << pos unless @known_cards[card.value].include?(pos)
  end

  def receive_match(card, pos1, pos2)
    @known_cards[card.value].delete(pos1)
    @known_cards[card.value].delete(pos2)
  end
end