class TrackList < ApplicationRecord
  belongs_to :user

  has_many :track_list_stocks, primary_key: :id, foreign_key: :track_list_id, dependent: :destroy
  has_many :stocks, through: :track_list_stocks

  validates :title, presence: true

  scope :order_with_serial, -> { order(serial: :asc) }

  def serial_up
    serial_swap(-1)
  end

  def serial_down
    serial_swap(1)
  end

  def serial_swap(level)
    replaced = user.track_lists.find_by(serial: self.serial + level)
    new_serial = replaced.serial
    
    # Change serial of track list
    replaced.serial = self.serial
    self.serial = new_serial

    replaced.save!
    self.save!
  end
end
