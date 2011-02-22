# == Schema Information
#
# Table name: goals
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  opened_at  :datetime
#  closed_at  :datetime
#  status     :integer(4)
#  subject    :text
#  created_at :datetime
#  updated_at :datetime
#

class Goal < ActiveRecord::Base
  validates_presence_of :subject
  validates_length_of :subject, :maximum => 90
  belongs_to :user
  
  def destroy
    self.deleted_at = Time.now
    self.save
    return
  end
  
  def finish
    self.closed_at = Time.now
    if self.save
      return true
    else
      return false
    end
  end

  def self.todo_today
    goals = self.find(
      :all,
      :conditions => ['closed_at IS NULL AND deleted_at IS NULL and created_at > ?', (DateTime.now - 1).strftime("%Y-%m-%d %H:%M:%S")]
    )
    return goals
  end

  def self.todo_this_week
    goals = self.find(
      :all,
      :conditions => ['closed_at IS NULL AND deleted_at IS NULL and created_at > ?', (DateTime.now - 7).strftime("%Y-%m-%d %H:%M:%S")]
    )
    return goals
  end

  def self.finished_today
    goals = self.find(
      :all,
      :conditions => ['deleted_at IS NULL and closed_at > ?', (DateTime.now - 1).strftime("%Y-%m-%d %H:%M:%S")]
    )
    return goals
  end

  def self.finished_this_week
    goals = self.find(
      :all,
      :conditions => ['deleted_at IS NULL and closed_at > ?', (DateTime.now - 7).strftime("%Y-%m-%d %H:%M:%S")]
    )
    return goals
  end

  def self.todo(args = {})
    if args.include? :limit
      goals = self.find(
        :all,
        :conditions => 'closed_at IS NULL AND deleted_at IS NULL',
        :order => 'created_at desc',
        :limit => args[:limit]
      )
    else
      goals = self.find(
        :all,
        :conditions => 'closed_at IS NULL AND deleted_at IS NULL',
        :order => 'created_at desc'
      )
    end
  end

  def self.finished(args = {})
    if args.include? :limit
      goals = self.find(
        :all,
        :conditions => 'closed_at IS NOT NULL AND deleted_at IS NULL',
        :order => 'closed_at desc',
        :limit => args[:limit]
      )
    else
      goals = self.find(
        :all,
        :conditions => 'closed_at IS NOT NULL AND deleted_at IS NULL',
        :order => 'closed_at desc'
      )
    end
    return goals
  end
end
