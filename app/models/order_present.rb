class OrderPresent < ApplicationRecord
  belongs_to :order
  belongs_to :present
end
