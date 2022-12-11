require 'csv'
require 'date'

puts 'Time targeting initialized...'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)
hours_hash = Hash.new

contents.each do |row|
  regtime = row[:regdate]

  hour = DateTime.strptime(regtime, "%m/%d/%y %k:%M").hour
  if hours_hash.key?(hour)
    hours_hash[hour] += 1
  else
    hours_hash[hour] = 1
  end
end
hours_hash = hours_hash.sort_by {|hour, count| count}
puts "The top 3 best hours:"
hours_hash[-3..].each do |hour, count|
  puts hour
end
puts "Full List:"
puts "[Hour, Count]"
p hours_hash
