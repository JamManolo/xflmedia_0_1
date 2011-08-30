class FixGroupColumnName < ActiveRecord::Migration
  def up
    rename_column :groups, :type, :affiliation
  end

  def down
  end
end
