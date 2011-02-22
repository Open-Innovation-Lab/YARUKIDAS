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

class Trainer < ActiveRecord::Base
  attr_accessible :id, :name, :alias, :profile_image_url

  has_many :users
  has_many :trainers_messages

  def newest_message
    message = TrainersMessage.find(
      :first,
      :conditions => ["trainer_id = ? and date <= ?", 1, Time.now.strftime("%y-%m-%d")],
      :order => 'date desc'
    )

    return message
  end
end
