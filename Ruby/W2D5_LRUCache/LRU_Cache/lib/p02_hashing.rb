class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    curr_hash = 0
    each_with_index do |el, i|
      curr_hash = (curr_hash) ^ (el.hash + i.hash)
    end
    curr_hash
  end

end

class String
  def hash
    chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    to_a.sort_by(&:hash).hash
  end
end
