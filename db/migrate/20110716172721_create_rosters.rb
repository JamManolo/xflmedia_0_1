class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.string :name
      t.string :roles
      t.integer :group_id

      t.timestamps
    end
  end
end
