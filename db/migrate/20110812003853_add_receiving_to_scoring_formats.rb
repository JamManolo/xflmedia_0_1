class AddReceivingToScoringFormats < ActiveRecord::Migration
  def change
    add_column :scoring_formats, :rec_rec_pts,           :integer
    add_column :scoring_formats, :rec_yds_min,           :integer
    add_column :scoring_formats, :rec_yds_min_pts,       :integer
    add_column :scoring_formats, :rec_yds_incr,          :integer
    add_column :scoring_formats, :rec_yds_incr_pts,      :integer
    add_column :scoring_formats, :rec_yds_bonus_min,     :integer
    add_column :scoring_formats, :rec_yds_bonus_min_pts, :integer
    add_column :scoring_formats, :rec_tds_pts,           :integer
    add_column :scoring_formats, :rec_tds_bonus_min,     :integer
    add_column :scoring_formats, :rec_tds_bonus_min_pts, :integer
  end
end
