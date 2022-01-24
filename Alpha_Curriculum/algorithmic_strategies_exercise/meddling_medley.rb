# uncompress
# Write a method uncompress that accepts a string as an argument. The string will be formatted so every letter is followed by a number. The method should return an "uncompressed" version of the string where every letter is repeated multiple times given based on the number that appears directly after the letter.
def uncompress(str)
  i = 0
  new_str = ""
  while i < str.length
    new_str += str[i] * str[i + 1].to_i
    i += 2
  end
  new_str
end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

# conjunct_select
# Write a method conjunct_select that accepts an array and one or more procs as arguments. The method should return a new array containing the elements that return true when passed into all of the given procs.
def conjunct_select(arr, *proc_arr)
  arr.select {|el| proc_arr.all? {|proc| proc.call(el)}}
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

# convert_pig_latin
# Write a method convert_pig_latin that accepts a sentence as an argument. The method should translate the sentence according to the following rules:
# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word begins with a vowel, simply add 'yay' to the end of the word (example: 'eat'->'eatyay')
# if the word begins with a non-vowel, move all letters that come before the word's first vowel to the end of the word and add 'ay' (example: 'trash'->'ashtray')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.
def convert_pig_latin(sent)
  sent.split.map do |word|
    if word.length < 3
      word
    else
      if "aeiou".include?(word[0].downcase)
        word + "yay"
      elsif word.chars.none? {|c| "aeiou".include?(c.downcase)}
        word
      else
        # find first vowel index
        i = 0
        until "aeiou".include?(word[i].downcase)
          i += 1
        end
        if word[0] == word[0].upcase
          (word[i..-1] + word[0...i] + "ay").capitalize
        else
          word[i..-1] + word[0...i] + "ay"
        end
      end
    end
  end.join(" ")
end


# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

# reverberate
# Write a method reverberate that accepts a sentence as an argument. The method should translate the sentence according to the following rules:
# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word ends with a vowel, simply repeat the word twice (example: 'like'->'likelike')
# if the word ends with a non-vowel, repeat all letters that come after the word's last vowel, including the last vowel itself (example: 'trash'->'trashash')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.
def reverberate(sent)
  sent.split.map do |word|
    if word.length < 3
      word
    elsif "aeiou".include?(word[-1].downcase)
      word + word.downcase
    else
      i = word.length - 1
      until "aeiou".include?(word[i].downcase)
        i -= 1
      end
      word + word[i..-1].downcase
    end
  end.join(" ")
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

# disjunct_select
# Write a method disjunct_select that accepts an array and one or more procs as arguments. The method should return a new array containing the elements that return true when passed into at least one of the given procs.
def disjunct_select(arr, *proc_arr)
  arr.select {|el| proc_arr.any? {|proc| proc.call(el)}}
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }
# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]
# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]
# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

# alternating_vowel
# Write a method alternating_vowel that accepts a sentence as an argument. The method should return a new sentence where the words alternate between having their first or last vowel removed. For example:
# the 1st word should be missing its first vowel
# the 2nd word should be missing its last vowel
# the 3rd word should be missing its first vowel
# the 4th word should be missing its last vowel
# ... and so on
# Note that words that contain no vowels should remain unchanged. Vowels are the letters a, e, i, o, u.
def remove_first_vowel(word)
  word.each_char.with_index do |char, i|
    if "aeiou".include?(word[i].downcase)
      return word[0...i] + word[i + 1..-1]
    end
  end
  word
end

def alternating_vowel(sent)
  sent.split.map.with_index do |word, i|
    if i.even?
      remove_first_vowel(word)
    else
      remove_first_vowel(word.reverse).reverse
    end
  end.join(" ")
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

# silly_talk
# Write a method silly_talk that accepts a sentence as an argument. The method should translate each word of the sentence according to the following rules:
# if the word ends with a vowel, simply repeat that vowel at the end of the word (example: 'code'->'codee')
# if the word ends with a non-vowel, every vowel of the word should be followed by 'b' and that same vowel (example: 'siren'->'sibireben')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.
def aba_translate(word)
  word.chars.map do |char|
    if "aeiou".include?(char.downcase)
      char + "b" + char.downcase
    else
      char
    end
  end.join
end
def silly_talk(sent)
  sent.split.map do |word|
    if "aeiou".include?(word[-1].downcase)
      word + word[-1]
    else
      aba_translate(word)
    end
  end.join(" ")
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

# compress
# Write a method compress that accepts a string as an argument. The method should return a "compressed" version of the string where streaks of consecutive letters are translated to a single appearance of the letter followed by the number of times it appears in the streak. If a letter does not form a streak (meaning that it appears alone), then do not add a number after it.
def compress(str)
  i = 0
  new_str = ""
  while i < str.length
    count = 0
    curr_char = str[i]
    while curr_char == str[i]
      count += 1
      i += 1
    end
    count == 1 ? new_str += curr_char : new_str += curr_char + count.to_s
  end
  new_str
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"