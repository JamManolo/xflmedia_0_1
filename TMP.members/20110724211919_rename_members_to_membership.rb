class RenameMembersToMembership < ActiveRecord::Migration
  def up
    rename_table :members, :memberships
  end

  def down
    rename_table :memberships, :members
  end
end
