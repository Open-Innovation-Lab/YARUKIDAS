require 'test_helper'

class TrainerTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Trainer.new.valid?
  end
end
