class OneComment
  attr_reader :the_comment, :owner

  def initialize(comment)
    @the_comment = comment
    owner_arr = get_the_comment_owner_detail
    @owner = owner_arr[0] #去掉数组类型
  end

  private
  def get_the_comment_owner_detail
    #User表字段是在太多了，只能手动写需要的字段
    User.find_by_sql(["SELECT users.user_id ,users.name,users.introduce,users.avatar from users,comments where users.user_id = comments.user_id and comments.user_id = ? and comments.comment_id = ?",@the_comment.user_id,@the_comment.comment_id])
  end
end