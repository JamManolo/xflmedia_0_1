class AddColsToLineupFormats < ActiveRecord::Migration
  def change
    add_column :lineup_formats, :ir, :integer
    add_column :lineup_formats, :bench, :integer
  end
end
