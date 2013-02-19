class PeopleController < ApplicationController
  PAGE_SIZE = 5

  def show
    @person = Person.new(params[:id])
    @user_id = @person.user_base.user_id
    @current_user_id = current_user.id
    @following_projects_count = @person.following_projects_count
    @following_projects = @person.following_projects

    set_asks = asks_list(@person.set_asks[0...PAGE_SIZE])
    if set_asks.empty?
      @set_asks = []
      @last_ask_id = 0
    else
      @set_asks = set_asks
      @last_ask_id = @set_asks[set_asks.size-1].the_ask.ask_id
    end
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def more_set_asks
    @page_num = params[:pagenum].to_i

    @person = Person.new(params[:id])
    @set_asks = asks_list(@person.get_set_asks_id_by_range(params[:ask_id],PAGE_SIZE,@page_num))

    respond_to do |format|
      format.js # more_set_asks.js.erb
    end
  end

  def more_answered_asks
    @page_num = params[:pagenum].to_i
    @person = Person.new(params[:id])
    @answered_asks = asks_list(@person.get_answered_asks_id_by_range(params[:ask_id],PAGE_SIZE,@page_num))

    respond_to do |format|
      format.js # more_set_asks.js.erb
    end
  end

  def more_favorites_asks
    @page_num = params[:pagenum].to_i
    @person = Person.new(params[:id])
    @favorites_asks = asks_list(@person.get_favorites_asks_id_by_range(params[:ask_id],PAGE_SIZE,@page_num))

    respond_to do |format|
      format.js # more_set_asks.js.erb
    end
  end

  def answered_asks
    @person = Person.new(params[:id])
    @user_id = @person.user_base.user_id

    answered_asks = asks_list(@person.answered_asks[0...PAGE_SIZE])
    if answered_asks.empty?
      @answered_asks = []
      @last_ask_id = 0
    else
      @answered_asks = answered_asks
      @last_ask_id = @answered_asks[answered_asks.size-1].the_ask.ask_id

    end

    respond_to do |format|
      format.js #answered_asks.js.erb
      format.html # answered_asks.html.erb
    end
  end

  def favorites_asks
    @person = Person.new(params[:id])
    @user_id = @person.user_base.user_id
    @current_user_id = current_user.id

    favorites_asks = asks_list(@person.favorites_asks[0...PAGE_SIZE])
    if favorites_asks.empty?
      @favorites_asks = []
      @last_ask_id = 0
    else
      @favorites_asks = favorites_asks
      @last_ask_id = @favorites_asks[favorites_asks.size-1].the_ask.ask_id
    end
    respond_to do |format|
      format.js #answered_asks.js.erb
      format.html # answered_asks.html.erb
    end

  end

  def follow_project
    @followed_project = FollowedProject.new
    @followed_project.user_id = current_user.id
    @followed_project.project_id = params[:project_id]
    state = @followed_project.save

    if state.eql?(false)
      @error = @followed_project.errors
    end

    respond_to do |format|
      format.js
    end
  end

  def unfollow_project
    @state = false
    @followed_project = FollowedProject.first(:conditions => ["user_id=? and project_id=?",current_user.id,params[:project_id]])
    @state = @followed_project.destroy

    respond_to do |format|
      format.js
    end
  end

  def collect_the_ask
    @favorite_ask = FavoriteAsk.new
    @favorite_ask.user_id=current_user.id
    @favorite_ask.ask_id= params[:ask_id]
    state = @favorite_ask.save

    if state.eql?(false)
      @error = @favorite_ask.errors
    end

    respond_to do |format|
      format.js
    end
  end

  def uncollect_the_ask
    @favorite_ask = FavoriteAsk.first(:conditions => ["user_id=? and ask_id=?",current_user.id,params[:ask_id]])
    state = @favorite_ask.destroy

    if state.eql?(false)
      @error = @favorite_ask.errors
    end

    respond_to do |format|
      format.js
    end
  end

  def add_as_classmate
    @classmate = Follower.new
    @classmate.follower_id = current_user.id
    @classmate.be_follower_id= params[:user_id]
    if @classmate.save
      @state = true #保存成功
    else
      @state = false #保存失败
    end
  end

  def subtract_the_classmate
    @classmate = Follower.delete_all(:follower_id=>current_user.id,:be_follower_id=>params[:user_id])
  end

  private
  def asks_list(asks)
    asks_arr = []
    asks.each do |ask|
      asks_arr << OneAsk.new(ask.ask_id)
    end
    asks_arr
  end

end
