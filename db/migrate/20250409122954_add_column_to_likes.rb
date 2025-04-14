class AddColumnToLikes < ActiveRecord::Migration[8.0]
  def change
    add_column :likes, :likable_id, :integer
  end
end
