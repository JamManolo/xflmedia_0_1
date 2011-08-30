class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :group_id
      t.integer :user_id

      t.timestamps
    end
    add_index :members, :group_id
    add_index :members, :user_id
    add_index :members, [:group_id, :user_id], :unique => true
  end
end
