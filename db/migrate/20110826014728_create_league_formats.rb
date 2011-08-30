class CreateLeagueFormats < ActiveRecord::Migration
  def change
    create_table :league_formats do |t|
      t.integer :group_id
      t.string :league_type
      t.integer :team_count
      t.string :comp_type
      t.integer :divisions
      t.string :sched_format

      t.timestamps
    end
  end
end
