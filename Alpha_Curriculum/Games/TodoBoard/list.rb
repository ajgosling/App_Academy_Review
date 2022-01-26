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
    idx = idx.to_i
    idx >= 0 && idx <= size - 1
  end

  def swap(idx1, idx2)
    idx1, idx2 = idx1.to_i, idx2.to_i
    return false unless valid_index?(idx1) && valid_index?(idx2)
    @items[idx1], @items[idx2] = @items[idx2], @items[idx1]
    true
  end

  def [](idx)
    idx = idx.to_i
    return nil unless valid_index?(idx)
    @items[idx]
  end

  def priority
    @items.first
  end

  def toggle_item(idx)
    idx = idx.to_i
    return nil unless valid_index?(idx)
    self[idx].toggle
  end

  def remove_item(idx)
    return false unless valid_index?(idx)
    @items.delete_at(idx)
    true
  end

  def purge
    idx = @items.length - 1
    while idx >= 0
      if self[idx].done
        remove_item(idx)
      end
      idx -= 1
    end
    true
  end

  def print
    puts "-" * 50
    puts @label.center(50)
    puts "-" * 50
    puts "Index | Item#{" " * 19}|  Deadline  | Done"
    puts "-" * 50
    @items.each_with_index do |i, idx|
      i_str = idx.to_s.ljust(6)
      t_str = i.title.ljust(23)
      d_str = i.deadline
      done = i.done ? "X" : " "
      puts "#{i_str}| #{t_str}| #{d_str} |  #{done}"
    end
    puts "-" * 50
  end

  def print_full_item(idx)
    idx = idx.to_i
    if i = self[idx]
      done = i.done ? "Done: Yes" : "Done: No"
      puts "-" * 50
      puts "#{i.title.ljust(20)}#{i.deadline.center(20)}#{done}"
      puts "#{i.description}"
      puts
      puts "-" * 50
    end
  end

  def print_priority
    print_full_item(0)
  end

  def up(idx, amt=1)
    idx, amt = idx.to_i, amt.to_i
    if valid_index?(idx)
      [amt, idx].min.times do |time|
        swap(idx - time, idx - time - 1)
      end
      true
    else
      false
    end
  end

  def down(idx, amt=1)
    idx, amt = idx.to_i, amt.to_i
    if valid_index?(idx)
      [amt, size - 1 - idx].min.times do |time|
        swap(idx + time, idx + time + 1)
      end
      true
    else
      false
    end
  end

  def sort_by_date!
    @items.sort_by! {|i| i.deadline}
  end
end

p "done"
l = List.new("DADS CAR THING")
l.add_item('Fix login page', '2019-10-22', 'It loads slow.')
l.add_item('buy a cheeseburger', '2018-02-31', 'yummy! what a tasty burger!')
l.add_item('fix car', '2020-02-30', 'need to take car to Jiffy Lube')
l.add_item('replace desk', '2017-11-01', 'upgrade to an electric standing desk')
l.add_item('drink water', '2019-10-11', 'important to stay hydrated!!!')
l.toggle_item(0)
l.toggle_item(2)
l.print
l.print_full_item(0)