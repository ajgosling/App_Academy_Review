def zip(*arrs)
  new_arrs = Array.new(arrs.first.length) {[]}
  arrs.each do |sub_arr|
    sub_arr.each_with_index do |el, i|
      new_arrs[i] << el
    end
  end
  new_arrs
end

def prizz_proc(arr, prc1, prc2)
  arr.select {|el| prc1.call(el) ^ prc2.call(el)}
end

def zany_zip(*arrs)
  result_arr = []
  max = arrs.map(&:length).max
  max.times do |i|
    sub_arr = []
    arrs.each do |arr|
      sub_arr << arr[i]
    end
    result_arr << sub_arr
  end

  result_arr
end

def maximum(arr, &prc)
  return nil if arr.empty?
  max_el = arr.first
  max_res = prc.call(max_el)
  arr.each do |el|
    res = prc.call(el)
    max_el = el if res >= max_res
  end
  max_el
end

def my_group_by(arr, &prc)
  hash = Hash.new {|h, k| h[k] = []}
  arr.each {|el| hash[prc.call(el)] << el}
  hash
end

def max_tie_breaker(arr, tie_prc, &prc)
  return nil if arr.empty?
  max_el = arr.first
  max_res = prc.call(max_el)
  arr.each do |el|
    res = prc.call(el)
    if res > max_res || tie_prc.call(el) > max_res
      max_el, max_res = el, res
    end
  end

  max_el
end

def sillify(word)
  vowels = "aeiou"
  i = 0
  first_idx = nil
  while i < word.length
    if vowels.include?(word[i].downcase)
      first_idx = i
      break
    end
    i += 1
  end
  i = word.length - 1
  while i >= 0
    if vowels.include?(word[i].downcase)
      last_idx = i
      break
    end
    i -= 1
  end
  return word if first_idx.nil? || first_idx == last_idx
  return word[first_idx..last_idx]
end

def silly_syllables(sent)
  sent.split.map {|word| sillify(word)}.join(" ")
end