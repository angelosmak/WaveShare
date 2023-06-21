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
# cleaning db
UserEvent.destroy_all
Review.destroy_all
Event.destroy_all
Profile.destroy_all
User.destroy_all


puts "All tables clear"

# Generate users, profiles, and events
users = []
event_titles = [
  "Sunset Yoga Session",
  "Beach Volleyball Tournament",
  "Surfing Lessons",
  "Family Picnic by the Shore",
  "Beach Cleanup Day",
  "Sandcastle Building Competition",
  "Bonfire Party under the Stars",
  "Beachside BBQ Extravaganza",
  "Live Music Concert on the Beach",
  "Water Sports Adventure Day",
  "Sand eating competition"
]
# these strings can be changed, all good
event_contents = [
  "Join us for a peaceful yoga session as the sun sets over the horizon. Embrace the tranquility and connect with nature.",
  "Compete in our thrilling beach volleyball tournament and show off your skills. Grab your friends and get ready for some intense matches!",
  "Learn to ride the waves with our professional instructors. Surfing lessons for beginners and experienced surfers alike.",
  "Gather your loved ones and enjoy a delightful picnic by the shore. Indulge in delicious food and create cherished memories.",
  "Join us in making a difference! Help us clean up the beach and contribute to the preservation of our beautiful coastline.",
  "Unleash your creativity and participate in our sandcastle building competition. Build your dream castle and win exciting prizes!",
  "Experience the warmth of a bonfire party under the starry sky. Enjoy music, laughter, and great company by the beach.",
  "Indulge in a mouthwatering BBQ feast by the beach. Savor grilled delicacies and enjoy the ocean breeze with friends and family.",
  "Immerse yourself in the rhythmic tunes of live music as you unwind on the sandy shores. Let the melodies carry you away.",
  "Embark on an adventurous day filled with thrilling water sports. Dive into excitement and make a splash on the waves."
]

review_titles = [
  "A Blissful Beach Experience",
  "Memorable Moments by the Sea",
  "Unforgettable Beach Getaway",
  "Tranquility at Its Best",
  "Beach Paradise Found",
  "Sun, Sand, and Happiness",
  "Rejuvenation by the Shore",
  "A Perfect Beach Retreat",
  "Serenity in Every Wave",
  "Magical Beach Memories",
  "Seagulls are scary..."
]

review_contents = [
  "I recently visited this beach, and it was a truly blissful experience. The serene atmosphere and breathtaking views captivated my heart.",
  "Every moment spent by the sea was filled with joy and laughter. The beach offered the perfect setting for unforgettable memories with loved ones.",
  "This beach getaway exceeded all expectations. The soothing sound of waves and the warm sand beneath my feet created a sense of pure relaxation.",
  "Tranquility at its best! The peaceful ambiance of this beach provided a much-needed escape from the hustle and bustle of everyday life.",
  "I found my own personal beach paradise at this stunning destination. The crystal-clear waters and pristine sands stole my heart away.",
  "Sun, sand, and pure happiness! This beach offered everything I needed for a delightful day in the sun. It's a true haven for beach lovers.",
  "A visit to this beach brought rejuvenation to my mind, body, and soul. The calming presence of the ocean washed away all worries.",
  "A perfect beach retreat to recharge and unwind. The gentle waves and gentle breeze created an idyllic environment for relaxation.",
  "Every wave carried a sense of serenity, and every sunset painted a picturesque scene. This beach left an indelible mark on my heart.",
  "Magical beach memories were made at this captivating destination. The beauty of nature merged with joyful moments, creating an enchanting experience.",
  "I was chased by a seagull and it stole my sandwich. 0/10 would not recommend."
]
# generate users and profiles
10.times do
  password = Faker::Internet.password(min_length: 6)
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: password,
    password_confirmation: password,
    created_at: Faker::Time.between(from: 1.years.ago, to: Time.current),
    updated_at: Faker::Time.between(from: 1.years.ago, to: Time.current)
  )
  users << user
  Profile.create!(
    user_id: user.id,
    username: Faker::Internet.unique.username,
    created_at: Faker::Time.between(from: 1.years.ago, to: Time.current),
    updated_at: Faker::Time.between(from: 1.years.ago, to: Time.current)
  )

# generate events
  events_set = Set.new
  rand(1..5).times do
    beach_id = Beach.pluck(:id).sample
    title = event_titles.sample
    content = event_contents.sample


    unique_event = false
    while !unique_event
      event = Event.new(
        beach_id: beach_id,
        user_id: user.id,
        title: title,
        date: Faker::Date.between(from: Date.today, to: Date.today + 30),
        description: content,
        created_at: Faker::Time.between(from: 1.years.ago, to: Time.current),
        updated_at: Faker::Time.between(from: 1.years.ago, to: Time.current)
      )

      unique_event = event.save if !events_set.include?([event.beach_id, event.title])
    end

    events_set.add([event.beach_id, event.title])
  end
end

# generate reviews
reviews_set = Set.new

users.each do |user|
  rand(1..5).times do
    beach_id = Beach.pluck(:id).sample
    title = review_titles.sample
    content = review_contents.sample


    unique_review = false
    while !unique_review
      review = Review.new(
        beach_id: beach_id,
        user_id: user.id,
        title: title,
        content: content,
        rating: rand(2..5),
        created_at: Faker::Time.between(from: 1.years.ago, to: Time.current),
        updated_at: Faker::Time.between(from: 1.years.ago, to: Time.current)
      )

      unique_review = review.save

      unless unique_review
        beach_id = Beach.pluck(:id).sample
      end
    end
  end
end

# Generate user-events
users.each do |user|
  rand_events = Event.pluck(:id).sample(rand(0..3))
  rand_events.each do |event_id|
    UserEvent.create!(
      user_id: user.id,
      event_id: event_id,
      created_at: Faker::Time.between(from: 1.years.ago, to: Time.current),
      updated_at: Faker::Time.between(from: 1.years.ago, to: Time.current)
    )
  end
end

puts "Seeds planted, water them, and watch them grow!"
