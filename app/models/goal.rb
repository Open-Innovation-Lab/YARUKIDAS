class Goal < ActiveRecord::Base
  attr_accessible :id, :user_id, :opened_at, :closed_at, :status, :subject
  
  validates_presence_of :subject
  belongs_to :user
end
