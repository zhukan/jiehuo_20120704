# coding: utf-8
class AsksController < ApplicationController
  # GET /asks
  # GET /asks.json

  #选项分隔符
  ITEM_SPLIT = "[split]"
  def index
    redirect_to "/home/index"
  end

  # GET /asks/1
  # GET /asks/1.json
  def show
    @ask = OneAsk.new(params[:id])
    @answer = Answer.new
    @person = Person.new(current_user.id)
    @interst = get_sidepage_interest_users

    @interest_ask = build_interest_ask(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /asks/new
  # GET /asks/new.json
  def new
    @domains = Domain.all
    @ask = Ask.new
    @person = Person.new(current_user.id)
    @hot_ask_rank = hot_ask_rank
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ask }
    end
  end

  # GET /asks/1/edit
  def edit
    @domains = Domain.all
    @ask = Ask.find(params[:id])
  end

  # POST /asks
  # POST /asks.json
  def create
    @ask = Ask.new(params[:ask])
    @ask.body = params[:ask][:body].strip
    @ask.user_id = current_user.id
    @ask.modifier = current_user.id
    @ask.image=params[:ask][:image]

    params[:section_hidden].each_key do |key|
      section = Section.find(key)
      @ask.sections << section
      @ask.project_id = section.project.project_id
    end

    @ask.body_item = ""
    @ask.state = 1

    params[:xuanxiang].each_value do |value|
      @ask.body_item = @ask.body_item + ITEM_SPLIT + value.strip
    end

    @ask.result = ""
    params[:daan].each do |key, val|
      case
        when key == "duoxuan"
          params[:daan][:duoxuan].each_value do |dx_value|
            @ask.result = @ask.result + "|"+ dx_value.strip
          end
        else
          if val==""
            @ask.result = "TA不知道答案,等待你的解答"
          else
            @ask.result = val
          end
      end
    end

    @ask.comment="在这里写上对习题的疑惑点，交代下题目的出处，对答疑很有帮助哦,可惜这家伙很懒，没写！" if params[:ask][:comment] == ""

    respond_to do |format|
      if @ask.save
        Ask.user_asks_count(@ask)
        Project.project_asks_count(@ask.project_id)
        format.html { redirect_to @ask }
      else
        format.html { redirect_to :action => "new" }
      end
    end

  end

  # PUT /asks/1
  # PUT /asks/1.json
  def update
    @ask = Ask.find(params[:id])

    respond_to do |format|
      if @ask.update_attributes(params[:ask])
        format.html { redirect_to @ask, notice: 'Ask was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asks/1
  # DELETE /asks/1.json
  def destroy
    @ask = Ask.find(params[:id])

    respond_to do |format|
      format.html { redirect_to asks_url }
      format.json { head :ok }
    end
  end

  def hide_ask
    @ask = Ask.find(params[:id])
    if @ask.user_id == current_user.id || current_user.email=="admin@sina.com"
      @ask.state=0
      if @ask.update_attributes(params[:ask])
          #同时删除收藏列表中的该问题记录
          FavoriteAsk.delete_all(["ask_id=?",@ask.ask_id])

          # 同时删除热门考题中该题目
          rem_ask_answers_count_by_ask_id_key  @ask.ask_id
          # 同时删除感兴趣考题中该题目
          rem_interest_ask   @ask.project_id,@ask.ask_id
      end
    else
      redirect_to "/home/index/"
    end
  end

  #相关考题,以学科为单位!,获取统计信息，只读！
  def build_interest_ask ask_id

    ask = Ask.find_by_ask_id ask_id
    project_id = ask.project_id
    key = $redis_interest_ask_project+project_id.to_s
    #该学科下问题排行
    interest_ask_count_rank = $redis.zrevrange(key, 0, -1, :with_scores => :with_scores)
    interest_ask_count_rank_hash = Hash[*(interest_ask_count_rank)]
    hash_key = {}
    interest_ask_count_rank_hash.each_pair do |k, v|
      interestAsk = InterestAsk.build_interest_ask k, v
      hash_key.store k, interestAsk
      if hash_key.size == INTEREST_ASK_NUM
        break
      end
    end
    hash_key
  end

  # get 通过领域找到领域下面的多个科目
  def get_projects_by_domain
    @project_domain=Project.find_all_by_domain_id(params[:id])
    respond_to do |format|
      format.json { render :json => @project_domain.to_json }
    end
  end

  # get 通过学科找到学科下面的多个知识点
  def get_sections_by_project
    @section_project= Section.find_all_by_project_id(params[:id])
    respond_to do |format|
      format.json { render :json => @section_project.to_json }
    end
  end

  private
  def av_params(par)
    case
      when !par.has_key?(:ask) then
        @error_msg = "params中ask参数不存在，页面有异常，保存不成功"
      when !par.has_key?(:section_hidden) then
        @error_msg = "params中section_hidden参数不存在，页面有异常，保存不成功"
      when !par.has_key?(:daan) then
        @error_msg = "params中daan参数不存在，页面有异常，保存不成功"
      when !par.has_key?(:xuanxiang) then
        @error_msg = "params中xuanxiang参数不存在，页面有异常，保存不成功"
      else
        @error_msg = nil
    end
  end
end
