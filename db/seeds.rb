# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

Create a main sample user.
User.create!(username:  "Example User",
    email: "test@test.com",
    password:              "foobar",
    password_confirmation: "foobar",
    occupation: "teacher",
    age: 30,
    school: "SamsenWittayalai school, Bangkok")

Generate a bunch of additional users.
99.times do |n|
name  = Faker::Name.name
email = Faker::Internet.email
job = Faker::Job.title
school = Faker::Nation.nationality + 'school'
password = "password"
age = Faker::Number.between(from: 24, to: 55)
User.create!(username:  name,
    email: email,
    password:              "foobar",
    password_confirmation: "foobar",
    occupation: job,
    age: age,
    school: school)
end

# Generate teaching_ideas for a subset of users.
users = User.order(:created_at).take(6)
50.times do
content = Faker::Lorem.sentence(word_count: 5)
users.each { |user| user.teaching_ideas.create!(content: content) }
end

# Create following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }