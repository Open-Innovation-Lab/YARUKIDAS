# == Schema Information
#
# Table name: cheer_messages
#
#  id           :integer(4)      not null, primary key
#  from_user_id :integer(4)
#  to_user_id   :integer(4)
#  contents     :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class CheerMessage < ActiveRecord::Base
  belongs_to :from_user, :class_name => 'User', :foreign_key => 'from_user_id'
  belongs_to :to_user, :class_name => 'User', :foreign_key => 'to_user_id'

  validates_presence_of :contents

  def self.messages(*args)
    object = args.first
    self.find(
      :all,
      :conditions => ['to_user_id = ?', object[:to_user_id]],
      :order => 'created_at desc'
    )
  end
end
