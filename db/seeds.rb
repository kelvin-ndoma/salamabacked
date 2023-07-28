# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Create some users with different roles (admin and normal)
User.create!(
  name: 'kelvin',
  email: 'kelvin@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  role: :admin
)

User.create!(
  name: 'user1',
  email: 'user@example.com',
  password: 'password123',
  password_confirmation: 'password123',
  role: :normal
)

# Create some activities
# Activity.create!(
#   name: 'Hiking Adventure',
#   picture: 'https://example.com/hiking.jpg',
#   description: 'Join us for an exciting hiking adventure in the mountains.',
#   scheduled_time: Time.now + 1.week
# )

# Activity.create!(
#   name: 'Cooking Class',
#   picture: 'https://example.com/cooking.jpg',
#   description: 'Learn to cook delicious meals with our professional chefs.',
#   scheduled_time: Time.now + 2.weeks
# )

# # Create comments for the activities
# activity1 = Activity.find_by(name: 'Hiking Adventure')
# activity2 = Activity.find_by(name: 'Cooking Class')

# Comment.create!(
#   content: 'This hiking trip was amazing!',
#   user: User.find_by(name: 'Normal User'),
#   activity: activity1
# )

# Comment.create!(
#   content: 'I had so much fun learning to cook!',
#   user: User.find_by(name: 'Normal User'),
#   activity: activity2
# )

# # Create ratings for the activities
# Rating.create!(
#   value: 5,
#   user: User.find_by(name: 'Normal User'),
#   activity: activity1
# )

# Rating.create!(
#   value: 4,
#   user: User.find_by(name: 'Normal User'),
#   activity: activity2
# )
