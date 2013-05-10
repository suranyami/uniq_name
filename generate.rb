require 'rubygems'
require 'google-search'

path = "/usr/share/dict/words"

file = File.open path
string = file.read
words = string.split "\n"
words = words.select do |word|
  word.length > 1 && word.length <= 4
end

100.times do
  names = (1..3).map do
    words.sample
  end
  name = names.join("")
  print "#{name}: "
  search = Google::Search::Web.new :query => "\"#{name}\""
  is_available = (search.get_response.items.length == 0)
  puts is_available ? "Available" : "NO"
end
