class FixItAttempt < ActiveRecord::Migration
  def up
#    remove_index :owners, :index_owners_on_roster_id_and_group_id
    remove_column :owners, :group_id
  end

  def down
  end
end
