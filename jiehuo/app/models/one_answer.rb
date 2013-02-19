# coding: utf-8
class OneAnswer
  attr_reader :the_answer, :owner, :comments_count

  def initialize(answer)
    @the_answer = answer
    owner_arr = get_the_answer_owner_detail
    @owner = owner_arr[0]
    @comments_count = get_the_answer_comments_count
  end


  private
  def get_the_answer_owner_detail
    #User表字段是在太多了，只能手动写需要的字段
    User.find_by_sql(["SELECT users.user_id, users.name,users.introduce,users.avatar from users,answers where users.user_id = answers.user_id and answers.user_id = ? and answers.answer_id = ?",@the_answer.user_id,@the_answer.answer_id])
  end

  #取出这个回答的评论总数
  def get_the_answer_comments_count
    count = $redis.zscore("answer_comments_count", @the_answer.answer_id)
    if count.nil?
      0
    else
      count
    end
  end
end
