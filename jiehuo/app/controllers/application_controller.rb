# coding: UTF-8
class ApplicationController < ActionController::Base
  #after_filter  :reset_last_captcha_code!,:except => [:school_ajax]
  #问题解答数有序集合的redis name
  $ask_answers_count_rank = "ask_answers_count_rank"
  #问题解题思路有序集合的redis name
  $ask_comments_count_rank = "ask_comments_count_rank"
  #问题解答评论数有序集合的redis name
  $ask_answers_comments_count_rank = "ask_answers_comments_count_rank"
  #热门问题数
  HOT_ASK_NUM = 5
  #redis感兴趣的考题以下面的value+project_id 为key,member为ask_id
  $redis_interest_ask_project = "interest_ask_project:"

  #感兴趣问题数
  INTEREST_ASK_NUM = 5



  # reset captcha code after each request for security
  #after_filter :reset_last_captcha_code!
 # before_filter :auto_login

  before_filter :authenticate_user!, :except => [:school_ajax,:register,:email_unique_ajax,:register_create]
  before_filter :cms_permission

  protect_from_forgery


 # rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found


  rescue_from ActionController::RoutingError, :with => :render_not_found


  private

  def auto_login
    sign_in(:user, User.find_by_email("ucgygah@sina.com"))
  end

  def render_not_found
    render :text => "页面不存在!"
  end

  def record_not_found
    render :text => "404 Not Found", :status => 404
  end

  def common_exception
    render :text => "505 Not Found", :status => 500
  end

  def get_redis_provinces
    symbol_redis_provinces = :redis_provinces
    unless ($redis.get(symbol_redis_provinces))
      provinces = Province.all
      $redis.set(symbol_redis_provinces, provinces.to_json)
    end
    JSON.parse($redis.get(symbol_redis_provinces))
  end


# admin用户才能访问cms后台
  def cms_permission
    url = request.url
    reg = /cms/
    if url =~ reg && current_user && current_user.email != 'admin@sina.com'
      redirect_to root_url #返回没权限页面
    end

  end

# 你可能感兴趣的同学
  def get_sidepage_interest_users
    InterestUser.get_int_users(current_user.id, 0)
  end

  #密码重置后跳转页面
  def after_sending_reset_password_instructions_path_for(resource_name)
    "/signin"
  end


  # 热门考题统计前5名
  #return hash   {key:ask_id,value:HotAsk}
  def hot_ask_rank
    ask_count_rank = $redis.zrevrange($ask_answers_count_rank, 0, -1, :with_scores => :with_scores)
    ask_count_rank_hash = Hash[*(ask_count_rank)]
    hash_key = {}
    ask_count_rank_hash.each_pair do |k, v|
      hotAsk = HotAsk.build_hot_ask k, v
      hash_key.store k, hotAsk
      if hash_key.size == HOT_ASK_NUM
        break
      end
    end
    hash_key
  end

  #考题删除后redis热门考题的key也要清空
  def rem_ask_answers_count_by_ask_id_key    ask_id

    $redis.zrem($ask_answers_count_rank, ask_id)

  end
  #考题删除后redis感兴趣考题
  def rem_interest_ask   project_id, ask_id
    key = $redis_interest_ask_project+project_id.to_s
    $redis.zrem(key, ask_id)

  end

  #每个问题解答，解题思路，评论统计显示
  def build_answer_type_info_count redis_type, asks
    ask_type_rank = $redis.zrevrange(redis_type, 0, -1, :with_scores => :with_scores)
    ask_type_rank_hash = Hash[*(ask_type_rank)]
    hash_key = {}
    asks.each do |ask|
      if (ask_type_rank_hash.has_key?(ask.ask_id.to_s))
        hash_key.store ask.ask_id.to_s, ask_type_rank_hash[ask.ask_id.to_s]
      else
        hash_key.store ask.ask_id.to_s, 0
      end
    end
    hash_key
  end
end
