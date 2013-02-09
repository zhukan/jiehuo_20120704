class Cms::SectionsController < ApplicationController
  # GET /cms/sections
  # GET /cms/sections.json
  def index
    @sections = Section.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sections }
    end
  end

  # GET /cms/sections/1
  # GET /cms/sections/1.json
  def show
    @section = Section.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @section }
    end
  end

  # GET /cms/sections/new
  # GET /cms/sections/new.json
  def new
    @section = Section.new
    @project = Project.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @section }
    end
  end

  # GET /cms/sections/1/edit
  def edit
    @section = Section.find(params[:id])
    @project = Project.all
  end

  # POST /cms/sections
  # POST /cms/sections.json
  def create
    @section = Section.new(params[:section])

    respond_to do |format|
      if @section.save
        format.html { redirect_to cms_section_path(@section), notice: 'Section was successfully created.' }
        format.json { render json: cms_section_path(@section), status: :created, location: @section }
      else
        format.html { render action: "new" }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cms/sections/1
  # PUT /cms/sections/1.json
  def update
    @section = Section.find(params[:id])

    respond_to do |format|
      if @section.update_attributes(params[:section])
        format.html { redirect_to cms_section_path(@section), notice: 'Section was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cms/sections/1
  # DELETE /cms/sections/1.json
  def destroy
    @section = Section.find(params[:id])
    @section.destroy

    respond_to do |format|
      format.html { redirect_to cms_sections_url }
      format.json { head :ok }
    end
  end
end
