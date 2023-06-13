class Beach < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :events, dependent: :destroy
end
