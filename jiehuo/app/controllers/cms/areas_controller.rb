# coding: UTF-8
class Cms::AreasController < ApplicationController
  # GET /cms/areas
  # GET /cms/areas.json
  def index
    @areas = Area.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @areas }
    end
  end

  # GET /cms/areas/1
  # GET /cms/areas/1.json
  def show
    @area = Area.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @area }
    end
  end

  # GET /cms/areas/new
  # GET /cms/areas/new.json
  def new
    @area = Area.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @area }
    end
  end

  # GET /cms/areas/1/edit
  def edit
    @area = Area.find(params[:id])
  end

  # POST /cms/areas
  # POST /cms/areas.json
  def create
    @area = Area.new(params[:area])

    respond_to do |format|
      if @area.save
        format.html { redirect_to cms_area_path(@area), notice: 'Area was successfully created.' }
        format.json { render json: cms_area_path(@area), status: :created, location: @area }
      else
        format.html { render action: "new" }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cms/areas/1
  # PUT /cms/areas/1.json
  def update
    @area = Area.find(params[:id])

    respond_to do |format|
      if @area.update_attributes(params[:area])
        format.html { redirect_to cms_area_path(@area), notice: 'Area was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cms/areas/1
  # DELETE /cms/areas/1.json
  def destroy
    @area = Area.find(params[:id])
    @area.destroy

    respond_to do |format|
      format.html { redirect_to cms_areas_url }
      format.json { head :ok }
    end
  end
end
