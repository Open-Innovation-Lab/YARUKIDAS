require 'test_helper'

class CheerMessageTest < ActiveSupport::TestCase
  should belong_to(:from_user)
  should belong_to(:to_user)

  test "the truth" do
    assert true
  end
end
