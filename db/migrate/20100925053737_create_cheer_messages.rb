class CreateCheerMessages < ActiveRecord::Migration
  def self.up
    create_table :cheer_messages do |t|
      t.integer :id
      t.integer :from_user_id
      t.integer :to_user_id
      t.string :contents
      t.timestamps
    end
  end
  
  def self.down
    drop_table :cheer_messages
  end
end
