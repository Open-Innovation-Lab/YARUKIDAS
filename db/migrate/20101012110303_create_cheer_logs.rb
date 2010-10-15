class CreateCheerLogs < ActiveRecord::Migration
  def self.up
    create_table :cheer_logs do |t|
      t.integer :goal_id
      t.integer :from_user_id
      t.integer :to_user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :cheer_logs
  end
end
