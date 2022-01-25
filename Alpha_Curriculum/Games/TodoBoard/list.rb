require_relative 'item.rb'

class List
  attr_reader :label
  def initialize(label)
    @label = label
    @items = []
  end

  def add_item(title, deadline, description="")
    begin
      new_item = Item.new(title, deadline, description)
    rescue
      false
    else
      @items << new_item
      true
    end
  end

  def size
    @items.length
  end

  def valid_index?(idx)
    idx >= 0 && idx <= size - 1
  end

  def swap(idx1, idx2)
    return false unless valid_index?(idx1) && valid_index?(idx2)
    @items[idx1], @items[idx2] = @items[idx2], @items[idx1]
    true
  end

  def [](idx)
    return nil unless valid_index?(idx)
    @items[idx]
  end

  def priority
    @items.first
  end

  def print
    puts "-" * 40
    puts @label.center(40)
    puts "-" * 40
    puts "Index | Item          | Deadline"
    puts "-" * 40


  end
end

l = List.new("DADS CAR THING")
l.add_item('Fix login page', '2019-10-22', 'It loads slow.')
l.add_item('buy a cheeseburger', '2018-02-31', 'yummy!')
l.swap(0, 1)
l
l.print