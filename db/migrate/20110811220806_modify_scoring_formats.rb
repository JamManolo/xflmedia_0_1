class ModifyScoringFormats < ActiveRecord::Migration
  def up
    add_column :scoring_formats, :pass_tds_bonus_min, :integer
    rename_column :scoring_formats, :pass_tds_50_plus_pts, :pass_tds_bonus_min_pts
  end
end
