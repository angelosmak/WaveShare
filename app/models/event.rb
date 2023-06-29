class Event < ApplicationRecord
  belongs_to :beach
  belongs_to :user
  has_many :user_events
  has_one_attached :photo

  geocoded_by :address
end
