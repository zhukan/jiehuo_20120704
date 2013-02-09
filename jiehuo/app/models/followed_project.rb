# coding: utf-8
class FollowedProject < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  validate :followed_to_many_projects, :on => :create
  validate :unique_followed_projects, :on => :create

  def followed_to_many_projects
    if FollowedProject.count(:conditions => ["user_id=?",self.user_id]) >= 15
      errors.add(:followed_to_many_projects,"关注了太多的科目")
    end
  end

  def unique_followed_projects
    if FollowedProject.exists?(:user_id=>self.user_id, :project_id=>self.project_id)
      errors.add(:unique_followed_projects,"一个科目只能被关注一次")
    end
  end

end
