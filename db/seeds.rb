3.times do |topic|
  Topic.create!(
    title: "title #{topic}"
  )
end
puts "3 topics created"

10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: "MSMssmsmms smsn sbhbhbshbhbr rbhebrj r",
    topic_id: Topic.last.id
  )
end

puts "10 blogpost created"

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
  )
end

puts "5 skill created"

9.times do |portfolio|
  Portfolio.create!(
    title: "Portfolio #{portfolio}",
    subtitle: "Ruby on Rails #{portfolio}",
    body: "New Body Yes",
  )
end

puts "9 Portfolio created"

3.times do |technology|
  Technology.create!(
    name: "Tech #{technology}",
    portfolio_id: Portfolio.last.id
  )
end

puts "3 Technology created"
