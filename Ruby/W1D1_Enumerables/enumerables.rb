class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    return self
  end

  def my_select(&prc)
    new_arr = []
    self.my_each {|el| new_arr << el if prc.call(el)}
    return new_arr
  end

  def my_reject(&prc)
    new_arr = []
    self.my_each {|el| new_arr << el unless prc.call(el)}
    return new_arr
  end

  def my_any?(&prc)
    self.my_each {|el| return true if prc.call(el)}
    false
  end

  def my_all?(&prc)
    self.my_each {|el| return false unless prc.call(el)}
    true
  end

  def my_flatten
    new_arr = []
    self.each do |el|
      el.is_a?(Array) ? new_arr += el.my_flatten : new_arr << el
    end
    new_arr
  end

  def my_zip(*args)
    args.unshift(self)
    max_length = args.map(&:length).max
    new_arr = Array.new(max_length) {[]}
    max_length.times do |time|
      args.each {|arr| new_arr[time] << arr[time]}
    end
    new_arr
  end

  def my_rotate(times=1)
    until times >= 0
      times += self.length
    end
    times %= self.length
    self[times..-1] + self[0...times]
  end

  def my_join(separator="")
    new_str = ""
    i = 0
    while i < self.length - 1
      new_str += self[i].to_s + separator
      i += 1
    end
    return new_str + self[-1].to_s
  end

  def my_reverse
    new_arr = []
    self.each {|el| new_arr.unshift(el)}
    new_arr
  end
end


p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]