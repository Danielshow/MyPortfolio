10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: "MSMssmsmms smsn sbhbhbshbhbr rbhebrj r"
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
    subtitle: "My great #{portfolio}",
    body: "New Body Yes",
    thumb_image: "https://via.placeholder.com/350x200",
    main_image: "https://via.placeholder.com/600x400"
  )
end

puts "9 Portfolio created"
