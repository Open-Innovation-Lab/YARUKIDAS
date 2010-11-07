# == Schema Information
#
# Table name: goals
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  opened_at  :datetime
#  closed_at  :datetime
#  status     :integer(4)
#  subject    :text
#  created_at :datetime
#  updated_at :datetime
#

class Goal < ActiveRecord::Base
  attr_accessible :id, :user_id, :opened_at, :closed_at, :status, :subject
  
  validates_presence_of :subject
  belongs_to :user
end
