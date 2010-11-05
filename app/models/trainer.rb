class Trainer < ActiveRecord::Base
  attr_accessible :id, :name, :alias, :profile_image_url

  has_many :trainers_messages
end
