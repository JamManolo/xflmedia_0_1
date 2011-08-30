class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :group_id
      t.string :email
      t.boolean :open

      t.timestamps
    end
    add_index :invitations, [:group_id, :email], :unique => true
  end
end
