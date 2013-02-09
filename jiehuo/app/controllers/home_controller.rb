# coding: UTF-8
class HomeController < ApplicationController
  #分页记录数
  PAGE_SIZE = 10
  #
  # 网站登录成功后的首页Action
  #

  def index

    @sidepage_interest_users = get_sidepage_interest_users
    @hot_ask_rank = hot_ask_rank
    @projects = current_user.projects
    @person = Person.new(current_user.id)
    @prj_id = params[:prj_id]
    if (!@prj_id||@prj_id=="all")
      @prj_id = "all"
      @asks = Ask.home_all_ask(PAGE_SIZE)
    else
      @asks = Ask.home_ask_with_project(PAGE_SIZE, @prj_id)
    end

    @last_ask_id = 0
    @new_ask_id = 0
    if (@asks.size>0)
      @last_ask_id = @asks.last.ask_id
      @new_ask_id = @asks.first.ask_id
    end
    build_redis_answer_all_info @asks
    return @asks
  end


  #每个问题解答，解题思路，评论等各类统计
  def build_redis_answer_all_info asks

    #每个问题解答统计显示
    @redis_answer_result_info_count = build_answer_type_info_count $ask_answers_count_rank, asks
    #每个问题解题思路统计显示
    @redis_answer_comment_info_count = build_answer_type_info_count $ask_comments_count_rank, asks
    #每个问题解题评论统计显示
    @redis_answer__discuss_info_count = build_answer_type_info_count $ask_answers_comments_count_rank, asks

  end


  #home页面点击更多时加载最近的分页数据

  def ajax_roll_page
    @page_num = 0
    @current_ask_id = params[:current_ask_id]

    @prj_id = params[:prj_id]
    if (!@prj_id||@prj_id=="all")
      @ajax_asks = Ask.home_ajax_with_all(@current_ask_id, PAGE_SIZE, @page_num)
    else
      @ajax_asks = Ask.home_ajax_with_proj(@current_ask_id, @prj_id, PAGE_SIZE, @page_num)
    end
    if (@ajax_asks.size<=0)
      return false
    end
    build_redis_answer_all_info @ajax_asks

    if (@ajax_asks.last)
      @last_ask_id = @ajax_asks.last.ask_id
      return @ajax_asks
    else
      return false
    end
  end

  def ajax_count_new_ask

    @new_ask_id = params[:new_ask_id]
    @project_id = params[:prj_id]
    if (!@project_id||@project_id=="all")
      @new_ask_count = Ask.ajax_count_new_ask_with_all @new_ask_id
    else
      @new_ask_count = Ask.ajax_count_new_ask_with_proj @new_ask_id, @project_id
    end
    return @new_ask_count

  end

end
