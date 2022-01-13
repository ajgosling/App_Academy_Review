def all_words_capitalized?(arr)
    arr.all? {|word| word == word.capitalize}
end

def no_valid_url?(arr)
    arr.none? {|url| url.end_with?(".com", ".net", ".io", ".org")}
end

def any_passing_students?(arr)
    arr.any? {|student| student[:grades].sum / student[:grades].size >= 75}
end