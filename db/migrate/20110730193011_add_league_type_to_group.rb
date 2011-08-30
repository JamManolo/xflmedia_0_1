class AddLeagueTypeToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :league_type, :string
  end
end
