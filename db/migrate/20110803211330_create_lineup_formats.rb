class CreateLineupFormats < ActiveRecord::Migration
  def change
    create_table :lineup_formats do |t|
      t.integer :qb
      t.integer :rb
      t.integer :wr
      t.integer :te
      t.integer :k
      t.integer :dst
      t.integer :idp
      t.integer :flex

      t.timestamps
    end
  end
end
