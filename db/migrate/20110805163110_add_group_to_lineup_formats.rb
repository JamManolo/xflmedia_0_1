class AddGroupToLineupFormats < ActiveRecord::Migration
  def change
    add_column :lineup_formats, :group_id, :integer
  end
end
