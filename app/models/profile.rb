class Profile < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :user_events
  geocoded_by :address
end
