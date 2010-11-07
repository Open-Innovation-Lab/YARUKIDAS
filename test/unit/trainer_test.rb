# == Schema Information
#
# Table name: trainers
#
#  id                :integer(4)      not null, primary key
#  name              :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  alias             :string(255)
#  profile_image_url :string(255)
#

require 'test_helper'

class TrainerTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Trainer.new.valid?
  end
end
