class FixColumnsInRosterAndOwner < ActiveRecord::Migration
  def up
    # add_column :owners, :group_id, :integer
    # remove_column :rosters, :group_id
    # add_column :rosters, :owner_id, :integer
    #add_column :rosters, :group_id, :integer
    remove_column :owners, :owner_id
    #add_column :owners, :roster_id, :integer
  end

  #def down
  #end
end
