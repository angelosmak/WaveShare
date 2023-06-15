# # Review.destroy_all
# # UserEvent.destroy_all
# # Event.destroy_all
# # Beach.destroy_all
# # User.destroy_all
# #This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
# #   Character.create(name: "Luke", movie: movies.first)
# # db/seeds.rb

# # Create users
# # Create users
# user1 = User.create!(email: "user4@example.com", password: "password", password_confirmation: "password")
# user2 = User.create!(email: "user5@example.com", password: "password", password_confirmation: "password")
# user3 = User.create!(email: "user6@example.com", password: "password", password_confirmation: "password")

# # Create profiles


# # Create beaches
# beaches = Beach.create([
#   { name: "Beach 1", latitude: 123.456, longitude: 789.012, address: "Address 1", description: "Description 1" },
#   { name: "Beach 2", latitude: 345.678, longitude: 901.234, address: "Address 2", description: "Description 2" },
#   { name: "Beach 3", latitude: 567.890, longitude: 123.456, address: "Address 3", description: "Description 3" }
# ])

# # Create events
# events = Event.create([
#   { title: "Event 1", date: Date.today, description: "Event description 1", beach: beaches.sample, user_id: user3.id },
#   { title: "Event 2", date: Date.today, description: "Event description 2", beach: beaches.sample, user_id: user2.id },
#   { title: "Event 3", date: Date.today, description: "Event description 3", beach: beaches.sample, user_id: user1.id }
# ])

# # Create reviews
# reviews = Review.create([
#   { title: "Review 1", content: "Review content 1", rating: 5, beach: beaches.sample, user_id: user3.id },
#   { title: "Review 2", content: "Review content 2", rating: 4, beach: beaches.sample, user_id: user2.id },
#   { title: "Review 3", content: "Review content 3", rating: 3, beach: beaches.sample, user_id: user1.id }
# ])

# # Create user events
# user_events = UserEvent.create([
#   { user_id: user1.id, event: events[0] },
#   { user_id: user2.id, event: events[1] },
#   { user_id: user3.id, event: events[2] }
# ])

# # puts "Seeds executed successfully."

require 'faker'

Profile.destroy_all
Review.destroy_all
UserEvent.destroy_all
Event.destroy_all
Beach.destroy_all
User.destroy_all
#This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Create users
# Create users
