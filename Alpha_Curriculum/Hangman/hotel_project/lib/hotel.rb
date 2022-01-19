require_relative "room"

class Hotel
  attr_reader :rooms
  def initialize(name, room_hash)
    @name = name
    @rooms = {}
    room_hash.each {|k, v| @rooms[k] = Room.new(v)}
  end

  def name
    @name.split.map(&:capitalize).join(" ")
  end

  def room_exists?(room_name)
    @rooms.has_key?(room_name)
  end

  def check_in(person_str, room_name)
    if room_exists?(room_name)
      if @rooms[room_name].add_occupant(person_str)
        p "check in successful"
      else
        p "sorry, room is full"
      end
    else
      p "sorry, room does not exist!"
    end
  end

  def has_vacancy?
    !@rooms.all? {|k, v| v.full?}
  end

  def list_rooms
    @rooms.each do |name, room|
      puts "#{name} : #{room.available_space}"
    end
  end
end