class PosTerminal::Poster < ApplicationRecord
  has_one :place, as: :pos_terminal
  validates :waiter_id, :account, :access_token, presence: true
end
