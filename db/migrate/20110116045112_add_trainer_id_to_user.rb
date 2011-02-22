class AddTrainerIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :trainer_id, :integer, :default => '1', :null => false
  end

  def self.down
    remove_column :users, :trainer_id
  end
end
