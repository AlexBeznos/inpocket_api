class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :user, :place, :content, presence: true
  validate :user_sign_in

  def user_sign_in
    if !user || !user.signed
      errors.add(:user, 'should be signed')
    end
  end
end
