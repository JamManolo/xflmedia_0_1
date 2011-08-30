class AddMoreToScoringFormat < ActiveRecord::Migration
  def change
    add_column :scoring_formats, :misc_tds_pts, :integer
    add_column :scoring_formats, :misc_tds_bonus_min, :integer
    add_column :scoring_formats, :misc_tds_bonus_min_pts, :integer
    add_column :scoring_formats, :two_pt_conv_pass_pts, :integer
    add_column :scoring_formats, :two_pt_conv_rush_pts, :integer
    add_column :scoring_formats, :two_pt_conv_rec_pts, :integer
    add_column :scoring_formats, :pat_pts, :integer
    add_column :scoring_formats, :pat_missed_pts, :integer
    add_column :scoring_formats, :fg_0039_pts, :integer
    add_column :scoring_formats, :fg_4049_pts, :integer
    add_column :scoring_formats, :fg_5099_pts, :integer
    add_column :scoring_formats, :fg_missed_pts, :integer
  end
end
