require 'test_helper'

class TrainersMessageTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert TrainersMessage.new.valid?
  end
end
