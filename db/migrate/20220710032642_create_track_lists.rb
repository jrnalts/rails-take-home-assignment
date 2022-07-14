class CreateTrackLists < ActiveRecord::Migration[6.1]
  def change
    create_table :track_lists do |t|
      t.references :user
      t.string :title

      t.timestamps
    end
  end
end
