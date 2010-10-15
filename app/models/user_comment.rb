class UserComment < ActiveRecord::Base
  attr_accessible :id, :user_id, :trainers_message_id, :contents
  
  belongs_to :user
end
