class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.integer :code, limit: 6, comment: '股票代號'
      t.string :name, comment: '股票名稱'
      t.decimal :price

      t.timestamps
    end
    add_index :stocks, :code
    add_index :stocks, :name, unique: true
  end
end
