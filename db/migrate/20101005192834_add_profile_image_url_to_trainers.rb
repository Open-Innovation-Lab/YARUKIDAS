class AddProfileImageUrlToTrainers < ActiveRecord::Migration
  def self.up
    add_column :trainers, :profile_image_url, :string
  end

  def self.down
    remove_column :trainers, :profile_image_url
  end
end
