class UserScore < ApplicationRecord
  include Paginatable
  belongs_to :user
  belongs_to :place
end
