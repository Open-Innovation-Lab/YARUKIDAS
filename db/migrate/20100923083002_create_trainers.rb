class CreateTrainers < ActiveRecord::Migration
  def self.up
    create_table :trainers do |t|
      t.integer :id
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :trainers
  end
end
