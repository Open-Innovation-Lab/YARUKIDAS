class Trainer < ActiveRecord::Base
  attr_accessible :id, :name

  has_many :trainers_messages
end
