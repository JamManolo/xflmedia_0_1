class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.integer :user_id
      t.integer :roster_id

      t.timestamps
    end
    add_index :owners, :user_id
    add_index :owners, :roster_id
    add_index :owners, [:user_id, :roster_id], :unique => true
    delete_index :owners, [:roster_id, :group_id]
  end
end
