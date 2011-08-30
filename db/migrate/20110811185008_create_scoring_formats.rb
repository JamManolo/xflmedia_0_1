class CreateScoringFormats < ActiveRecord::Migration
  def change
    create_table :scoring_formats do |t|
      t.string  :name
      t.integer :group_id
      t.integer :pass_yds_min
      t.integer :pass_yds_min_pts
      t.integer :pass_yds_incr
      t.integer :pass_yds_incr_pts
      t.integer :pass_yds_bonus_min
      t.integer :pass_yds_bonus_min_pts
      t.integer :pass_tds_pts
      t.integer :pass_tds_50_plus_pts
      t.integer :pass_int_pts
      t.integer :pass_int_pick_6_pts

      t.timestamps
    end
  end
end
