class AlterGoals < ActiveRecord::Migration
  def self.up
    drop_table :goals

    create_table :goals do |t|
      t.integer :id
      t.integer :user_id
      t.datetime :opened_at
      t.datetime :closed_at
      t.integer :status
      t.text :subject
      t.timestamps
    end
  end

  def self.down
    dop_table :goals

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
end
