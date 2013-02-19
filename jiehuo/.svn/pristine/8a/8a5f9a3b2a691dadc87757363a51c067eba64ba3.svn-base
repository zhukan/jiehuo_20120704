class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    #@comments = Comment.all
    redirect_to "/home/index"
    #respond_to do |format|
      #format.html # index.html.erb
      #format.json { render json: @comments }
    #end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    #@comment = Comment.find(params[:id])
    redirect_to "/home/index"
    #respond_to do |format|
      #format.html # show.html.erb
      #format.json { render json: @comment }
    #end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    #@comment = Comment.new
    redirect_to "/home/index"
    #respond_to do |format|
      #format.html # new.html.erb
      #format.json { render json: @comment }
    #end
  end

  # GET /comments/1/edit
  def edit
    #@comment = Comment.find(params[:id])
    redirect_to "/home/index"
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    @comment.modifier = current_user.id

    respond_to do |format|
      if @comment.save
        #redis保存评论数
        ask_answers_comments_count  @comment.answer.ask_id
        @one_comment = OneComment.new(@comment)
        @answer_id = @comment.answer_id
        @state = "OK"
        answer_id = @answer_id.to_s
        $redis.zincrby("answer_comments_count", 1, answer_id)
        format.js
      else
        @state = "Error"
        format.js
      end
    end
  end

  #问题的评论次数统计  做+1
  def ask_answers_comments_count ask_id
    ask_id_key = ask_id.to_s
    $redis.zincrby($ask_answers_comments_count_rank, 1, ask_id_key)
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    redirect_to "/home/index"
    #@comment = Comment.find(params[:id])
    #respond_to do |format|
      #if @comment.update_attributes(params[:comment])
        #format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        #format.json { head :ok }
      #else
        #format.html { render action: "edit" }
        #format.json { render json: @comment.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    redirect_to "/home/index"
    #@comment = Comment.find(params[:id])
    #respond_to do |format|
      #format.html { redirect_to comments_url }
      #format.json { head :ok }
    #end
  end

  def an_answer_comments
    @answer_id = params[:id]
    @comment = Comment.new
    @comments = []
    Answer.find(@answer_id).comments.each do |comment|
      @comments << OneComment.new(comment)
    end
    @comments
  end

end
