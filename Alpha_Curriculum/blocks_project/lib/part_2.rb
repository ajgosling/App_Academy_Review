def all_words_capitalized?(arr)
    arr.all? {|word| word == word.capitalize}
end

def no_valid_url?(arr)
    arr.none? {|url| url.end_with?(".com", ".net", ".io", ".org")}
end