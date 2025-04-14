class AddTypeColumnToLikes < ActiveRecord::Migration[8.0]
  def change
    add_column :likes, :likable_type, :string
  end
end
