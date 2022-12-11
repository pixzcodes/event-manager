require 'csv'
require 'date'

puts 'Time targeting initialized...'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)
hours_hash = Hash.new
weekday_hash = Hash.new
contents.each do |row|
  regtime = row[:regdate]
  time_obj = DateTime.strptime(regtime, "%m/%d/%y %k:%M")
  hour = time_obj.hour
  day = time_obj.wday
  if hours_hash.key?(hour)
    hours_hash[hour] += 1
  else
    hours_hash[hour] = 1
  end
  if weekday_hash.key?(day)
    weekday_hash[day] += 1
  else
    weekday_hash[day] = 1
  end
end
hours_hash = hours_hash.sort_by {|hour, count| count}
puts "The top 3 best hours:"
hours_hash[-3..].each {|hour, count| puts hour}
puts "Full List:"
puts "[Hour, Count]"
p hours_hash
weekday_hash = weekday_hash.sort_by {|day, count| count}
puts "The top 3 best days:"
weekday_hash[-3..].each do |day, count|
  case day
  when 0
    puts "Sunday"
  when 1
    puts "Monday"
  when 2 
    puts "Tuesday"
  when 3
    puts "Wednesday"
  when 4 
    puts "Thursday"
  when 5 
    puts "Friday"
  when 6
    puts "Saturday"
  else
    puts "Error"
  end
end
