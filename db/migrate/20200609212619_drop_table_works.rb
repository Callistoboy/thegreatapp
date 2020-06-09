class DropTableWorks < ActiveRecord::Migration[5.0]
  def change
    drop_table :works
  end
end
