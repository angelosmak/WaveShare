class Event < ApplicationRecord
  belongs_to :beach
  belongs_to :user
  has_many :user_events
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
