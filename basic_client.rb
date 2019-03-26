require_relative 'ruby-talks'

bot = RubyTalks.new(:name => 'Dyl', :data_file => 'RT_data')

puts bot.greeting

while input = gets and input.chomp != 'end'
  puts '>> ' + bot.response_to(input)
end

puts bot.farewell