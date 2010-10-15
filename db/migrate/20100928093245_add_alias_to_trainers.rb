class AddAliasToTrainers < ActiveRecord::Migration
  def self.up
    add_column :trainers, :alias, :string
  end

  def self.down
    remove_column :trainers, :alias
  end
end
