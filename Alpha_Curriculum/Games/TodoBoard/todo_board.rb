require_relative 'list.rb'

class TodoBoard
  attr_accessor :list_hash
  def initialize
    # @list = List.new(label)
    @list_hash = {}
  end

  def get_command
    print "\nEnter a command: "
    cmd, label, *args = gets.chomp.split(' ')

    case cmd
    when 'ls'
      @list_hash.each do |label, list|
        puts "#{(label + ":").ljust(15)} #{list.size} items"
      end
    when 'showall'
      @list_hash.each {|label, list| list.print}
    when 'mklist'
      if @list_hash.include?(label)
        puts "list already exists"
      else
        @list_hash[label] = List.new(label)
      end
    when 'mktodo'
      @list_hash[label].add_item(*args)
    when 'up'
      @list_hash[label].up(*args)
    when 'down'
      @list_hash[label].down(*args)
    when 'swap'
      @list_hash[label].swap(*args)
    when 'toggle'
      @list_hash[label].toggle_item(*args)
    when 'rm'
      @list_hash[label].remove_item(*args)
    when 'purge'
      @list_hash[label].purge
    when 'sort'
      @list_hash[label].sort_by_date!
    when 'priority'
      @list_hash[label].print_priority
    when 'print'
      if args.empty?
        @list_hash[label].print
      else
        @list_hash[label].print_full_item(*args)
      end
    when 'quit'
      return false
    else
      print "Sorry, that command is not recognized."
    end

    true
  end

  def run
    while get_command
    end
    puts "Thanks for Trying the Todo-List!"
  end
end

my_board = TodoBoard.new
g = List.new("groceries")
g.add_item("butter", "2019-10-24")
g.add_item("milk", "2019-10-23")
g.add_item("candy", "2019-10-31", "sugar-free")
g.add_item("toothpaste", "2019-10-29")
t = List.new("tech")
t.add_item("ruby", "2019-10-24")
t.add_item("rails", "2019-11-02")
t.add_item("javascript", "2019-11-30")

my_board.list_hash["groceries"] = g
my_board.list_hash["tech"] = t

my_board.run