# == Schema Information
#
# Table name: cheer_messages
#
#  id           :integer(4)      not null, primary key
#  from_user_id :integer(4)
#  to_user_id   :integer(4)
#  contents     :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class CheerMessage < ActiveRecord::Base
  attr_accessible :id, :from_user_id, :to_user_id, :contents

  belongs_to :from_user, :class_name => 'User', :foreign_key => 'from_user_id'
  belongs_to :to_user, :class_name => 'User', :foreign_key => 'to_user_id'
end
