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

require 'test_helper'

class UserCommentTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert UserComment.new.valid?
  end
end
