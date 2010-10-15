class CreateUserComments < ActiveRecord::Migration
  def self.up
    create_table :user_comments do |t|
      t.integer :id
      t.integer :user_id
      t.integer :trainers_message_id
      t.string :contents
      t.timestamps
    end
  end
  
  def self.down
    drop_table :user_comments
  end
end
