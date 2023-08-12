class Message < ApplicationRecord
  belongs_to :user
  belongs_to :beach
  has_many :comments
  has_many :replies, class_name: 'Message', foreign_key: 'parent_id', dependent: :destroy
  belongs_to :parent, class_name: 'Message', optional: true
end
