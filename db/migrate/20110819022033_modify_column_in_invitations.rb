class ModifyColumnInInvitations < ActiveRecord::Migration
  def up
    rename_column :invitations, :open, :is_open
  end
end
