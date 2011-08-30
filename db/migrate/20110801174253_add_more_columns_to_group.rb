class AddMoreColumnsToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :divcount, :integer
    add_column :groups, :sched_format, :string
  end
end
