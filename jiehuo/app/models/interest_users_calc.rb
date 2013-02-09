# coding: utf-8

#总体思路
#第一优先级取当前用户相同学校的同学且这些同学起码问过问题或者答过问题，填充可能感兴趣的同学buff
#如果第一优先级不能填充满buff则进入第二优先级计算
#第二优先级为与当前用户关注相同的学科的同学，关注学习相同度越高，优先级越高，取出这些用户信息填充buff
#如果第二优先级还是未能充满buff则进入第三优先级计算
#第三优先级为非当前用户的其他用户中回答问题最多或者提出问题最多的用户
class InterestUsersCalc
  BUFF_SIZE = 50
  private_class_method :new

  def self.calc_one_user(cur_user_id)
    delete_old_interest_user(cur_user_id)
    @cur_user = User.find(cur_user_id)
    @int_users = []
    matching_school if @int_users.size <= BUFF_SIZE
    matching_projects if @int_users.size <= BUFF_SIZE
    most_answer_users if @int_users.size <= BUFF_SIZE
    most_ask_users if @int_users.size <= BUFF_SIZE
    new_users if @int_users.size <= BUFF_SIZE

    @int_users.each do |user|
      user.save
    end
  end

  def self.calc_all
    users = User.all
    users.each do |user|
      calc_one_user(user.user_id)
    end
  end

  private
  def self.matching_school
    users = User.all(:conditions => ["school_id=? and user_id != ? and user_id not in (select be_follower_id from followers where follower_id=?)", @cur_user.school_id, @cur_user.user_id,@cur_user.user_id])
    users.each do |user|
      if is_buff_not_include_the_user?(user.user_id) #(has_asks?(user.user_id) || has_answers?(user.user_id))
        @int_user = InterestUser.new
        @int_user.cur_user_id=@cur_user.user_id
        @int_user.int_user_id=user.user_id
        @int_user.state = 1
        @int_user.score=10
        @int_user.reason="你们在同一所学校学习"
        @int_users << @int_user unless @int_users.size >= BUFF_SIZE
      end
    end
    @int_users
  end

  def self.matching_projects
    users = FollowedProject.find_by_sql(["select f2.user_id from followed_projects f1,followed_projects f2 where f1.user_id=? and f1.project_id=f2.project_id and f2.user_id<>? and f2.user_id not in (select be_follower_id from followers where follower_id=?)", @cur_user.user_id, @cur_user.user_id,@cur_user.user_id])
    users.each do |user|
      if is_buff_not_include_the_user?(user.user_id) #(has_asks?(user.user_id) || has_answers?(user.user_id))
        @int_user = InterestUser.new
        @int_user.cur_user_id=@cur_user.user_id
        @int_user.int_user_id=user.user_id
        @int_user.state = 1
        @int_user.score=8
        @int_user.reason="你们关注共同的学科"
        @int_users << @int_user unless @int_users.size >= BUFF_SIZE
      end
    end
    @int_users
  end

  def self.most_answer_users
    user_answers_count = $redis.zrevrange("user_answers_count", 0, -1, :with_scores => :with_scores)
    user_answers_count_hash = Hash[*user_answers_count]
    user_answers_count_hash.each_pair do |key, value|
      if is_buff_not_include_the_user?(key) && !is_self?(key) && is_followed?(key)
        @int_user = InterestUser.new
        @int_user.cur_user_id=@cur_user.user_id
        @int_user.int_user_id=key
        @int_user.state = 1
        @int_user.score=6
        @int_user.reason="TA解答了#{value}个考题"
        @int_users << @int_user unless @int_users.size >= BUFF_SIZE
      end
    end
    @int_users
  end

  def self.most_ask_users
    user_asks_count = $redis.zrevrange("user_asks_count", 0, -1, :with_scores => :with_scores)
    user_asks_count_hash = Hash[*user_asks_count]
    user_asks_count_hash.each_pair do |key, value|
      if is_buff_not_include_the_user?(key) && !is_self?(key) && is_followed?(key)
        @int_user = InterestUser.new
        @int_user.cur_user_id=@cur_user.user_id
        @int_user.int_user_id=key
        @int_user.state = 1
        @int_user.score=4
        @int_user.reason="TA发布了#{value}个考题"
        @int_users << @int_user unless @int_users.size >= BUFF_SIZE
      end
    end
    @int_users
  end

  def self.new_users
    users = User.all(:conditions => ["user_id != ? and user_id not in (select be_follower_id from followers where follower_id=?)", @cur_user.user_id,@cur_user.user_id],:order => "created_at desc",:limit => BUFF_SIZE)
    users.each do |user|
      if is_buff_not_include_the_user?(user.user_id) #(has_asks?(user.user_id) || has_answers?(user.user_id))
        @int_user = InterestUser.new
        @int_user.cur_user_id=@cur_user.user_id
        @int_user.int_user_id=user.user_id
        @int_user.state = 1
        @int_user.score=1
        @int_user.reason="TA刚刚加入，带TA一起解惑吧！"
        @int_users << @int_user unless @int_users.size >= BUFF_SIZE
      end
    end
    @int_users
  end

  def self.delete_old_interest_user(user_id)
    users = InterestUser.find_all_by_cur_user_id(user_id)
    users.each do |user|
      user.delete
    end
  end

  def self.has_asks?(user_id)
    Ask.exists?(:user_id => user_id)
  end

  def self.has_answers?(user_id)
    Answer.exists?(:user_id => user_id)
  end

  def self.is_buff_not_include_the_user?(user_id)
    state = true
    @int_users.each do |user|
      if user.int_user_id.to_s == user_id.to_s
        state = false
        break
      end
    end
    state
  end

  def self.is_self?(user_id)
    @cur_user.user_id.to_s == user_id.to_s
  end

  def self.is_followed?(user_id)
    state = true
    if Follower.exists?(:follower_id => @cur_user.user_id,:be_follower_id=>user_id)
      state = false
    end
    state
  end

end