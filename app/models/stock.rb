class Stock < ApplicationRecord
  scope :available, -> { where(deleted_at: nil)}
end
