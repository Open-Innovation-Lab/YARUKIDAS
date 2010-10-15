class CreateTrainersMessages < ActiveRecord::Migration
  def self.up
    create_table :trainers_messages do |t|
      t.integer :id
      t.integer :trainer_id
      t.text :contents
      t.date :date
      t.timestamps
    end
  end
  
  def self.down
    drop_table :trainers_messages
  end
end
