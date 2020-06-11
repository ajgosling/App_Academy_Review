# PHASE 2
def convert_to_int(str)
  begin
    res = Integer(str)
  rescue ArgumentError => e
    p "Couldn't convert #{str} to int"
  ensure
    res ||= 0
  end

  return res
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include?(maybe_fruit)
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else
    raise OtherFruitError
  end
end

def feed_me_a_fruit
  begin
    puts "Hello, I am a friendly monster. :)"

    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp

    reaction(maybe_fruit)
  rescue CoffeeError => e
    puts e.message
    retry
  rescue OtherFruitError => e
    puts e.message
  end


end

class CoffeeError < StandardError
  def message
    "Coffee? try again"
  end
end

class OtherFruitError < StandardError
  def message
    "That's not a fruit! what the heck!"
  end
end

# PHASE 4

class FriendError < StandardError
  def message
    "that doesn't sound like best friendship to me!"
  end
end
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise FriendError if yrs_known < 5
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end


