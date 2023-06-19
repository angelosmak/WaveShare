class Review < ApplicationRecord
  belongs_to :beach
  belongs_to :user
  has_many :ratings, dependent: :destroy
end
