class AddColumnsToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :size, :integer
    add_column :groups, :comp_type, :string
  end
end
