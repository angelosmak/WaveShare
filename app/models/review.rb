class Review < ApplicationRecord
  belongs_to :beach
  belongs_to :user
end
