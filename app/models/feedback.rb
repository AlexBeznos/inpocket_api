class Feedback < ApplicationRecord
  include Paginatable
  include UnixTimeable

  mount_uploader :image, BaseUploader
  unix_time :created_at

  belongs_to :user
  belongs_to :place

  validates :user, :place, :content, :stars, presence: true
  validates :stars, inclusion: { in: 1..5 }
  validate :user_sign_in

  def user_sign_in
    if !user || !user.signed
      errors.add(:user, 'should be signed')
    end
  end
end
