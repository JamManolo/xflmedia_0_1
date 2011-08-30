class DeleteRolesFromRosters < ActiveRecord::Migration
  def up
    remove_column :rosters, :roles
  end
end
