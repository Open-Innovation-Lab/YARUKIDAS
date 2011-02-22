class AddDeletedAtToGoals < ActiveRecord::Migration
  def self.up
    add_column :goals, :deleted_at, :datetime
  end

  def self.down
    remove_column :goals, :deleted_at
  end
end