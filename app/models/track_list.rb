class TrackList < ApplicationRecord
  belongs_to :user

  has_many :track_list_stocks, primary_key: :id, foreign_key: :track_list_id, dependent: :destroy
  has_many :stocks, through: :track_list_stocks

  validates :title, presence: true
end
