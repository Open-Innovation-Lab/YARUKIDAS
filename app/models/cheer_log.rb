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
end
