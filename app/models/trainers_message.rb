class TrainersMessage < ActiveRecord::Base
  attr_accessible :id, :trainer_id, :contents, :date
  
  belongs_to :trainer
end
