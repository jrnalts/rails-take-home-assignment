class AddSerialToTrackList < ActiveRecord::Migration[6.1]
  def change
    add_column :track_lists, :serial, :integer, lmiit: 6, default: 0, comment: '追蹤清單順序'
  end
end
