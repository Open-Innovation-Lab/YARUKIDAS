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

require 'test_helper'

class CheerMessageTest < ActiveSupport::TestCase
  should belong_to(:from_user)
  should belong_to(:to_user)

  test "the truth" do
    assert true
  end
end
