require 'rubygems'
require 'google-search'
require 'awesome_print'

PATH = "/usr/share/dict/words"
JOIN_WITH = "-"

file = File.open PATH
string = file.read
words = string.split "\n"
words = words.select do |word|
  word.length > 1 && word.length <= 6
end

100.times do
  num_words = rand(5) + 1
  names = (1..num_words).map do
    words.sample
  end
  name = names.join(JOIN_WITH)
  print "#{name}: "
  search = Google::Search::Web.new :query => "\"#{name}\""
  results = search.get_response
  ap results.items
  is_available = (results.items.length == 0)
  puts is_available ? "Available" : "NO"
end
