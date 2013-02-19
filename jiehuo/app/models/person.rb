# encoding: utf-8
class Person
  attr_reader :following_projects #关注的学科

  attr_reader :user_base

  def initialize(user_id)
    @user_id = user_id
    @user_base = User.find_by_user_id(@user_id)
  end

  def school
    School.find_by_school_id(@user_base.school_id)
  end

  def area
    province = Province.find_by_provinceid(@user_base.provinceid)
    city = City.find_by_cityid(@user_base.cityid)
    return "应该不是地球的" if province.nil?
    return @area = province.province if city.nil?
    @area = province.province + " " + city.city
  end

  #关注的学科总数
  def following_projects_count
    FollowedProject.count(:conditions => ["user_id=?",@user_id])
  end

  def following_projects
    @following_projects = []
    User.find(@user_id).projects.each do |project|
      @following_projects << OneProject.new(project)
    end
    @following_projects
  end

  #收藏的问题总数
  def favorites_asks_count
    FavoriteAsk.count(:conditions => ["user_id = ?",@user_id])
  end

  #收藏考题列表
  def favorites_asks
    Ask.where("ask_id in (select ask_id from favorite_asks where user_id=#{@user_id})").order("created_at desc")
  end

  def get_favorites_asks_id_by_range(current_ask_id,page_size,index)
    FavoriteAsk.find_by_sql(["SELECT DISTINCT ask_id FROM favorite_asks WHERE (ask_id < ? and user_id=?) ORDER BY ask_id desc LIMIT ? OFFSET ?",current_ask_id,@user_id,page_size,page_size*index])
  end
  
  #关注Ta的同学数量
  def follower_count
    Follower.count(:conditions => ["be_follower_id = ?",@user_id])
  end

  #关注Ta的同学
  def followers
    User.find_by_sql(["select user_id,name,introduce,avatar from users WHERE user_id in (select follower_id from followers where be_follower_id = ?)",@user_id])
  end

  #Ta关注的同学数量
  def following_count
    Follower.count(:conditions => ["follower_id = ?",@user_id])
  end

  #Ta关注的同学
  def following
    User.find_by_sql(["select user_id,name,introduce,avatar from users WHERE user_id in (select be_follower_id from followers where follower_id = ?)",@user_id])
  end

  #出过题目的总数
  def set_asks_count
    Ask.count(:conditions => ["user_id = ? and state = 1",@user_id])
  end

  #出过的题目
  def set_asks
    Ask.all(:conditions => "asks.user_id=#{@user_id} and state = 1",:order => "created_at desc")
  end

  #根据给定的id取一个范围内的ID
  def get_set_asks_id_by_range(current_ask_id,page_size,index)
    Ask.where("ask_id< ? and asks.user_id=#{@user_id} and state = 1", current_ask_id).order("ask_id desc").limit(page_size).offset(page_size*index)
  end

  #答过题目的总数
  def answered_asks_count
    Answer.count_by_sql(["SELECT count(DISTINCT answers.ask_id) FROM answers,asks WHERE answers.user_id = ? and asks.ask_id = answers.ask_id and asks.state = 1",@user_id])
  end

  #答过的题目
  def answered_asks
    Answer.find_by_sql(["SELECT DISTINCT answers.ask_id FROM answers,asks WHERE answers.user_id = ? and asks.ask_id = answers.ask_id and asks.state = 1 order by ask_id desc",@user_id])
  end

  def get_answered_asks_id_by_range(current_ask_id,page_size,index)
    Answer.find_by_sql(["SELECT DISTINCT answers.ask_id FROM answers,asks WHERE (answers.ask_id < ? and answers.user_id=? and asks.ask_id = answers.ask_id and asks.state = 1) ORDER BY answers.ask_id desc LIMIT ? OFFSET ?",current_ask_id,@user_id,page_size,page_size*index])
  end

end
