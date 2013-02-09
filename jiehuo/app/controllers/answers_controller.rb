# coding: UTF-8
class AnswersController < ApplicationController
  # GET /answers
  # GET /answers.json
  def index
    redirect_to "/home/index"
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    #@answer = Answer.find(params[:id])
    redirect_to "/home/index"
    #respond_to do |format|
      #format.html # show.html.erb
      #format.json { render json: @answer }
    #end
  end

  # GET /answers/new
  # GET /answers/new.json
  def new
    #@answer = Answer.new
    redirect_to "/home/index"
   # respond_to do |format|
      #format.html # new.html.erb
      #format.json { render json: @answer }
    #end
  end

  # GET /answers/1/edit
  def edit
    redirect_to "/home/index"
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(params[:answer])
    @answer.user_id=current_user.id
    @answer.modifier=current_user.id

    if params.has_key?(:multiple)
      @answer.result=""
      params[:multiple].each_value do |value|
        @answer.result= @answer.result + " "+ value
      end
    end

    respond_to do |format|
      if @answer.save
        Answer.user_answers_count(@answer)
        ask_answers_count @answer.ask_id
        project_ask_count @answer.ask_id
        if (!@answer.comment.blank?)
          ask_comments_count @answer.ask_id
        end
        @one_answer = OneAnswer.new(@answer)
        @state = "OK"
        format.js
      else
        @state = "Error"
        format.js
      end
    end
  end

  # PUT /answers/1
  # PUT /answers/1.json
  def update
    #@answer = Answer.find(params[:id])
    redirect_to "/home/index"
    #respond_to do |format|
      #if @answer.update_attributes(params[:answer])
        #format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        #format.json { head :ok }
      #else
        #format.html { render action: "edit" }
        #format.json { render json: @answer.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    redirect_to "/home/index"
  end

  #问题的解答次数统计  做+1
  def ask_answers_count ask_id
    ask_id_key = ask_id.to_s
    $redis.zincrby($ask_answers_count_rank, 1, ask_id_key)
    # 1000
  end

  #问题 解题思路的次数统计 做+1

  def ask_comments_count ask_id
    ask_id_key = ask_id.to_s
    $redis.zincrby($ask_comments_count_rank, 1, ask_id_key)
  end

  #解答问题时,以对应的学科redis常量+project_id为key,以问题id为member 做+1
  def project_ask_count ask_id
    ask = Ask.find_by_ask_id ask_id
    project_id = ask.project_id
    key = $redis_interest_ask_project+project_id.to_s
    ask_count = $redis.zscore($ask_answers_count_rank, ask_id.to_s)
    $redis.zadd(key, ask_count, ask_id.to_s)
  end


end
