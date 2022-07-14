class TrackListStock < ApplicationRecord
  belongs_to :track_list
  belongs_to :stock
end
