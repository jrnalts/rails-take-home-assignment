class CreateTrackListStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :track_list_stocks do |t|
      t.references :track_list, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
