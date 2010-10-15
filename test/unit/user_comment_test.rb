require 'test_helper'

class UserCommentTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert UserComment.new.valid?
  end
end
