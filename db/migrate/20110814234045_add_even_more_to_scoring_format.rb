class AddEvenMoreToScoringFormat < ActiveRecord::Migration
  def change
    add_column :scoring_formats, :fum_lost_pts, :integer
    add_column :scoring_formats, :d_safety_pts, :integer
    add_column :scoring_formats, :d_shutout_pts, :integer
    add_column :scoring_formats, :d_3_pts_or_less_pts, :integer
    add_column :scoring_formats, :d_6_pts_or_less_pts, :integer
    add_column :scoring_formats, :d_7_pts_or_less_pts, :integer
    add_column :scoring_formats, :d_9_pts_or_less_pts, :integer
    add_column :scoring_formats, :d_42_pts_or_more_pts, :integer
    add_column :scoring_formats, :d_50_pts_or_more_pts, :integer
    add_column :scoring_formats, :d_200_yds_or_less_pts, :integer
    add_column :scoring_formats, :d_450_yds_or_more_pts, :integer
    add_column :scoring_formats, :d_500_yds_or_more_pts, :integer
    add_column :scoring_formats, :d_fr_pts, :integer
    add_column :scoring_formats, :d_int_pts, :integer
    add_column :scoring_formats, :d_sack_pts, :integer
    add_column :scoring_formats, :d_block_kick_pts, :integer
    add_column :scoring_formats, :idp_tackle_pts, :integer
    add_column :scoring_formats, :idp_assist_pts, :integer
    add_column :scoring_formats, :idp_ff_pts, :integer
    add_column :scoring_formats, :idp_fr_pts, :integer
    add_column :scoring_formats, :idp_int_pts, :integer
    add_column :scoring_formats, :idp_sack_pts, :integer
    add_column :scoring_formats, :idp_safety_pts, :integer
    add_column :scoring_formats, :idp_block_kick_pts, :integer
  end
end
