require 'rubygems'

PATH = "/usr/share/dict/words"
JOIN_WITH = " "

file = File.open PATH
string = file.read
words = string.split "\n"
words = words.select do |word|
  word.length > 3 && word.length < 8
end

100.times do
  num_words = 4
  names = (1..num_words).map do
    words.sample
  end
  name = names.join(JOIN_WITH)
  puts name
end

