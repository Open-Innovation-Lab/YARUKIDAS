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

require 'test_helper'

class CheerLogTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
