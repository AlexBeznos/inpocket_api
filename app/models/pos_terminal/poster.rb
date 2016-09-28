class PosTerminal::Poster < ApplicationRecord
  validates :waiter_id, :account, :access_token, presence: true
end
