# == Schema Information
#
# Table name: trainers_messages
#
#  id         :integer(4)      not null, primary key
#  trainer_id :integer(4)
#  contents   :text
#  date       :date
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class TrainersMessageTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert TrainersMessage.new.valid?
  end
end
