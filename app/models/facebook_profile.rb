class FacebookProfile < ApplicationRecord
  belongs_to :user

  enum gender: ['male', 'female']

  validates :uid, :gender, :username, presence: true
  validates :uid, uniqueness: true
  validates :email, email: true, allow_blank: true, allow_nil: true
end
