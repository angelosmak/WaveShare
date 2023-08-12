class Message < ApplicationRecord
  belongs_to :user
  belongs_to :beach
  has_many :comments
  has_many :likes
end
