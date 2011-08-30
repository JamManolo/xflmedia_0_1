class AddNameToLineupFormats < ActiveRecord::Migration
  def change
    add_column :lineup_formats, :name, :string
  end
end
