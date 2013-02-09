class Project < ActiveRecord::Base
  self.set_primary_key :project_id
  belongs_to :domain
  has_many :sections
  has_many :asks
  has_many :FollowedProjects
  has_many :users,:through => :FollowedProjects
  #has_and_belongs_to_many :users 朱侃用through替代2012，5，2

  #每个科目下有多少个考题
  def self.project_asks_count(project_id)
    project_id_key = project_id
    $redis.zincrby("project_asks_count", 1, project_id_key)
  end
end
