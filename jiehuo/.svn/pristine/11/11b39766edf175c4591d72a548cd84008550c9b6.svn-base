# coding: UTF-8
class Cms::SchoolsController < ApplicationController
# GET /cms/schools
# GET /cms/schools.json
  def index
    @schools = School.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schools }
    end
  end

  # GET /cms/schools/1
  # GET /cms/schools/1.json
  def show
    @school = School.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @school }
    end
  end

  # GET /cms/schools/new
  # GET/cms/schools/new.json
  def new



    @provinces = get_redis_provinces().map { |u| [u["province"], u["provinceid"]] }


    @school = School.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @school }
    end
  end

  # GET /cms/schools/1/edit
  def edit
    @provinces = get_redis_provinces().map { |u| [u["province"], u["provinceid"]] }

    @school = School.find(params[:id])
  end

  # POST /cms/schools
  # POST /cms/schools.json
  def create
    @school = School.new(params[:school])
    @school.creator = "sys_creator"
    @school.modifier = "sys_modifier"
    respond_to do |format|
      if @school.save
        format.html { redirect_to cms_school_path(@school), notice: 'School was successfully created.' }
        format.json { render json: cms_school_path(@school), status: :created, location: @school }
      else
        format.html { render action: "new" }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cms/schools/1
  # PUT /cms/schools/1.json
  def update
    @school = School.find(params[:id])
    params[:school][:creator] = "sys_creator"
    params[:school][:modifier] = "sys_modifier"
    respond_to do |format|
      if @school.update_attributes(params[:school])
        format.html { redirect_to cms_school_path(@school), notice: 'School was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cms/schools/1
  # DELETE /cms/schools/1.json
  def destroy
    @school = School.find(params[:id])
    @school.destroy

    respond_to do |format|
      format.html { redirect_to cms_schools_url }
      format.json { head :ok }
    end
  end
end

