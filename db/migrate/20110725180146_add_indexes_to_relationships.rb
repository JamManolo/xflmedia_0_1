class AddIndexesToRelationships < ActiveRecord::Migration
  def change
    add_index :memberships, :league_id
    add_index :memberships, :member_id
    add_index :memberships, [:league_id, :member_id], :unique => true
  end
end
