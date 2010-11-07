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

class TrainersMessage < ActiveRecord::Base
  attr_accessible :id, :trainer_id, :contents, :date
  
  belongs_to :trainer
end
