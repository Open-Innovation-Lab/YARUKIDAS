# == Schema Information
#
# Table name: cheer_logs
#
#  id           :integer(4)      not null, primary key
#  goal_id      :integer(4)
#  from_user_id :integer(4)
#  to_user_id   :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

class CheerLog < ActiveRecord::Base
  belongs_to :from_user, :class_name => 'User', :foreign_key => 'from_user_id'
  belongs_to :to_user, :class_name => 'User', :foreign_key => 'to_user_id'

  validates_presence_of :to_user_id
  validates_presence_of :from_user_id
  validates_presence_of :goal_id
end
