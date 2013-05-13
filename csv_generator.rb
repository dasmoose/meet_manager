#!/usr/bin/env ruby
require 'faker'

GENDER = ["Male", "Female"]
AGE = ["7 & under", "8-10", "11-12", "13-15", "16-17", "18 & up"]

EVENT_COUNT = 20
SWIMMER_COUNT = 20 
out_file = File.open("test3.csv", "w")

# HEADER
out_file.print "last_name, first_name, gender, age"
EVENT_COUNT.times do |event|
  out_file.print ", #{event + 1}"
end
out_file.puts

# ENTRIES
SWIMMER_COUNT.times do 
  out_file.print "#{Faker::Name.last_name}, #{Faker::Name.first_name}, #{GENDER.sample}, #{AGE.sample}"
  EVENT_COUNT.times do
    if rand(1..10) == 5
      out_file.print ", #{rand(1..59)}:#{rand(1..59)}.#{rand(1..59)}"
    else 
      out_file.print ", " 
    end
  end
  out_file.puts
end
