class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
    add_index :managers, :user_id
    add_index :managers, :group_id
    add_index :managers, [:user_id, :group_id], :unique => true
  end
end
