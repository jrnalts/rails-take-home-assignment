class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, comment: '股票名稱'
      t.string :password

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
