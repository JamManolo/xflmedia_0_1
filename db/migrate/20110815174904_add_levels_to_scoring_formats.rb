class AddLevelsToScoringFormats < ActiveRecord::Migration
  def change
    add_column :scoring_formats, :d_pts_allowed_level_7, :integer
    add_column :scoring_formats, :d_pts_allowed_level_7_pts, :integer
    
    add_column :scoring_formats, :d_yds_allowed_level_3, :integer
    add_column :scoring_formats, :d_yds_allowed_level_3_pts, :integer
    
    add_column :scoring_formats, :d_yds_allowed_level_7, :integer
    add_column :scoring_formats, :d_yds_allowed_level_7_pts, :integer
  end
end
