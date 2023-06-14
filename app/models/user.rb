class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :profile
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  after_create :generate_profile

  private
  def generate_profile
    # Using the bang method will make sure to raise an error if
    # creating the profile fails for whatever reason
    Profile.create!(email: email, user_id: id)
  end
end

