class DropOpendAtFromGoals < ActiveRecord::Migration
  def self.up
    remove_column :goals, :opened_at
  end

  def self.down
    add_column :goals, :opened_at, :datetime
  end
end
