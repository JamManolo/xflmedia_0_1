class MoveColumnFromOwnerToRoster < ActiveRecord::Migration
  def up
    add_column :rosters, :group_id, :integer
    remove_column :owners, :group_id
  end

  #def down
  #end
end
