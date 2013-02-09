# coding: utf-8
#单个问题主业务类，这个类负责将页面想需要展示的数据从各个表中收集起来，并开放不同的方法供控制器调用
class OneAsk
  attr_reader :ask_id,:the_ask, :sections, :project, :answers

  def initialize(ask_id)
    @ask_id = ask_id
    @the_ask = get_the_ask_by_ask_id
    @sections = get_the_ask_sections
    @project = get_the_ask_project
    @answers = get_the_ask_answers
  end

  def owner
    @the_ask.user
  end

  def answers_count
    rank = $redis.zscore("ask_answers_count_rank",@ask_id)
    if rank
      rank
    else
      0
    end
  end

  def ask_comments_count
    rank = $redis.zscore("ask_comments_count_rank",@ask_id)
    if rank
      rank
    else
      0
    end
  end

  def ask_answers_comments_count
    rank = $redis.zscore("ask_answers_comments_count_rank",@ask_id)
    if rank
      rank
    else
      0
    end
  end

  private
  #通过问题id获取一个问题的所有相关内容
  def get_the_ask_by_ask_id
    Ask.find(@ask_id)
  end

  def get_the_ask_sections
    @the_ask.sections
  end

  def get_the_ask_project
    #Project.find(@the_ask.sections[0].project_id)
    Project.find_by_project_id(@the_ask.project_id)
  end

  def get_the_ask_answers
    answers_arr = []
    @the_ask.answers.each do |answer|
      answers_arr << OneAnswer.new(answer)
    end
    answers_arr
  end
end