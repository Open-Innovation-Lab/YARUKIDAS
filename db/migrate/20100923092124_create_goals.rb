class CreateGoals < ActiveRecord::Migration
  def self.up
    create_table :goals do |t|
      t.integer :id
      t.integer :user_id
      t.date :opened_at
      t.date :closed_at
      t.integer :status
      t.text :subject
      t.timestamps
    end
  end
  
  def self.down
    drop_table :goals
  end
end
