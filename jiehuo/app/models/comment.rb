class Comment < ActiveRecord::Base
  self.set_primary_key :comment_id
  belongs_to :user
  belongs_to :answer
end
