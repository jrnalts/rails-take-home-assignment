class AddDeletedAtToStock < ActiveRecord::Migration[6.1]
  def change
    add_column :stocks, :deleted_at, :datetime, comment: '刪除時間'
  end
end
