# coding: UTF-8
class Cms::UsersController < ApplicationController
  def index
    @users = User.where("school_id is not null")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end

  end

  # GET /cms/users/1
  # GET /cms/users/1.json
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /cms/users/new
  # GET /cms/users/new.json
  def new
    # @area = Area.all(:order => "name").map { |u| [u.name, u.id] }
    @province = get_redis_provinces().map { |u| [u["province"], u["provinceid"]] }
    @user = User.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /cms/users/1/edit
  def edit
    @province = get_redis_provinces().map { |u| [u["province"], u["provinceid"]] }
    @user = User.find(params[:id])
  end

  # POST /cms/users
  # POST /cms/users.json
  def create
    @user = User.new(params[:user])
    @province = get_redis_provinces().map { |u| [u["province"], u["provinceid"]] }
    respond_to do |format|
      if @user.save
        format.html { redirect_to cms_user_path(@user), notice: 'User was successfully created.' }
        format.json { render json: cms_user_path(@user), status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  # PUT /cms/users/1
  # PUT /cms/users/1.json
  def update
    @province = get_redis_provinces().map { |u| [u["province"], u["provinceid"]] }
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to cms_user_path(@user), notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cms/users/1
  # DELETE /cms/users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end

  def school_ajax
    province_id = params[:province_id]
    @schools = School.find_all_by_provinceid(province_id).map { |u| [u.name, u.id] };
    @province = get_redis_provinces().map { |u| [u["province"], u["provinceid"]] }
    respond_to do |format|
      format.js
    end
  end


end

