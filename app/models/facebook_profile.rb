class FacebookProfile < ApplicationRecord
  belongs_to :user

  enum gender: ['male', 'female']

  validates :uid, :email, :gender, :username, presence: true
  validates :uid, uniqueness: true
end
