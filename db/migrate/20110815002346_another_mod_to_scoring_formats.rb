class AnotherModToScoringFormats < ActiveRecord::Migration
  def up
    rename_column :scoring_formats, :d_3_pts_or_less_pts, :d_pts_allowed_level_1_pts
    add_column :scoring_formats, :d_pts_allowed_level_1, :integer

    rename_column :scoring_formats, :d_6_pts_or_less_pts, :d_pts_allowed_level_2_pts
    add_column :scoring_formats, :d_pts_allowed_level_2, :integer

    rename_column :scoring_formats, :d_9_pts_or_less_pts, :d_pts_allowed_level_3_pts
    add_column :scoring_formats, :d_pts_allowed_level_3, :integer

    rename_column :scoring_formats, :d_42_pts_or_more_pts, :d_pts_allowed_level_8_pts
    add_column :scoring_formats, :d_pts_allowed_level_8, :integer

    rename_column :scoring_formats, :d_50_pts_or_more_pts, :d_pts_allowed_level_9_pts
    add_column :scoring_formats, :d_pts_allowed_level_9, :integer

    rename_column :scoring_formats, :d_200_yds_or_less_pts, :d_yds_allowed_level_1_pts
    add_column :scoring_formats, :d_yds_allowed_level_1, :integer
    
    add_column :scoring_formats, :d_yds_allowed_level_2, :integer
    add_column :scoring_formats, :d_yds_allowed_level_2_pts, :integer

    rename_column :scoring_formats, :d_450_yds_or_more_pts, :d_yds_allowed_level_8_pts
    add_column :scoring_formats, :d_yds_allowed_level_8, :integer

    rename_column :scoring_formats, :d_500_yds_or_more_pts, :d_yds_allowed_level_9_pts
    add_column :scoring_formats, :d_yds_allowed_level_9, :integer

  end
end
