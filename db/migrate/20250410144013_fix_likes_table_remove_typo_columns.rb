class FixLikesTableRemoveTypoColumns < ActiveRecord::Migration[8.0]
  def change
    # Rename the existing table
    rename_table :likes, :old_likes

    # Create the correct table
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :likable, polymorphic: true, null: false
      t.timestamps
    end

    # Copy data from old to new table
    execute <<-SQL
      INSERT INTO likes (id, user_id, likable_id, likable_type, created_at, updated_at)
      SELECT id, user_id, likable_id, likable_type, created_at, updated_at
      FROM old_likes
    SQL

    # Drop the old table
    drop_table :old_likes
  end
end
