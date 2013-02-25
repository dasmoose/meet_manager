# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# 
#   Mayor.create(name: 'Emanuel', city: cities.first)
alphabet = ("a".."y").to_a

Team.create(name: 'Whale Team', short_name: 'whl', location: 'Saratoga, CA', coach_name: 'Mary Coachypants')
Team.create(name: 'Shark Team', short_name: 'shrk', location: 'Sunnyvale, CA', coach_name: 'Andrew Coachcoach')

for i in 0..100 do 
  Swimmer.create(first_name: "#{alphabet[i%alphabet.count]}f-1-#{i}", last_name: "#{alphabet[i%alphabet.count]}l-1-#{i}", team: Team.find_by_id(1), checked_in: false)
end

for i in 0..100 do 
  Swimmer.create(first_name: "#{alphabet[i%alphabet.count]}f-2-#{i}", last_name: "#{alphabet[i%alphabet.count]}l-2-#{i}", team: Team.find_by_id(2), checked_in: false)
end

strokes = ["Butterfly", "Backstroke", "Breaststroke", "Freestyle"]
distances = [25, 50, 100, 200, 500]

 strokes.each do |stroked|
   distances.each do |distanced|
    RaceType.create(stroke: stroked, distance: distanced, individual: true)
  end
end
