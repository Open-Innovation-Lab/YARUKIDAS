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

require 'test_helper'

class GoalTest < ActiveSupport::TestCase
  def test_should_be_valid
  end
end
