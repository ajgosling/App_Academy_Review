class Item
  def Item.valid_date?(date_string)
    date_arr = date_string.split("-")
    return false if date_arr.length != 3
    month = date_arr[1].to_i
    day = date_arr[2].to_i
    return false if month < 1 || month > 12
    return day >= 1 && day <= 31
  end

  attr_accessor :title, :deadline, :description
  def initialize(title, deadline, description)
    raise "invalid date" unless Item.valid_date?(deadline)
    @title = title
    @deadline = deadline
    @description = description
  end
end