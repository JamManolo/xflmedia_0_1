class ChangeMembershipColumnNames < ActiveRecord::Migration
  def up
    add_column :memberships, :member_id, :integer
    add_column :memberships, :league_id, :integer
    remove_column :memberships, :user_id
    remove_column :memberships, :group_id
  end
end
