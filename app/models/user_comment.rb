# == Schema Information
#
# Table name: user_comments
#
#  id                  :integer(4)      not null, primary key
#  user_id             :integer(4)
#  trainers_message_id :integer(4)
#  contents            :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#

class UserComment < ActiveRecord::Base
  attr_accessible :id, :user_id, :trainers_message_id, :contents
  
  belongs_to :user
end
