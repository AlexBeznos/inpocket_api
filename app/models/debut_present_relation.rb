class DebutPresentRelation < ApplicationRecord
  belongs_to :place
  belongs_to :user

  validates :place, :user, presence: true
end
