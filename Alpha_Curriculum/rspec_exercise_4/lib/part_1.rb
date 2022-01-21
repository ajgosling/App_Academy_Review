def my_reject(arr, &prc)
  return nil unless prc
  rejected_arr = []
  arr.each {|el| rejected_arr << el unless prc.call(el)}
  rejected_arr
end

def my_one?(arr, &prc)
  return nil unless prc
  count = 0
  arr.each do |el|
    count += 1 if prc.call(el)
    return false if count > 1
  end
  count == 1
end

def hash_select(hash, &prc)
  new_hash = {}
  hash.each {|k, v| new_hash[k] = v if prc.call(k, v)}
  new_hash
end

def xor_select(arr, prc1, prc2)
  arr.select {|el| [prc1.call(el), prc2.call(el)].count(true) == 1}
end

def proc_count(el, proc_arr)
  proc_arr.count {|proc| proc.call(el)}
end