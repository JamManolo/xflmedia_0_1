class AddLineupFormatToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :lineup_format_id, :integer
  end
end
