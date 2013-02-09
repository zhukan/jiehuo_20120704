class Answer < ActiveRecord::Base
  self.set_primary_key :answer_id
  belongs_to :user
  belongs_to :ask
  has_many :comments

  def self.user_answers_count(answer)
    user_id_key = answer.user_id
    $redis.zincrby("user_answers_count", 1, user_id_key)
  end

end
