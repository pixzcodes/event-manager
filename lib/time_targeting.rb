require 'csv'
require 'date'

puts 'Time targeting initialized...'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  regtime = row[:regdate]
  
  puts "reg time:"
  p regtime
  parse_time = DateTime.strptime(regtime, "%m/%d/%y %k:%M")
  puts "parsed time:"
  p parse_time
end