class Device < ApplicationRecord
  belongs_to :user
  has_secure_token :access_token
  enum platform: [:ios, :android, :web]
  validates :push_token, :platform, :user, presence: true
end
