# coding: UTF-8
class Cms::DomainsController < ApplicationController
  # GET /cms/domains
  # GET /cms/domains.json
  def index
    @cms_domains = Domain.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cms_domains }
    end
  end

  # GET /cms/domains/1
  # GET /cms/domains/1.json
  def show
    @cms_domain = Domain.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cms_domain }
    end
  end

  # GET /cms/domains/new
  # GET /cms/domains/new.json
  def new
    @cms_domain = Domain.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cms_domain }
    end
  end

  # GET /cms/domains/1/edit
  def edit
    @cms_domain = Domain.find(params[:id])
  end

  # POST /cms/domains
  # POST /cms/domains.json
  def create

    @cms_domain = Domain.new(params[:domain])#A此地cms_domain修改为domain

    respond_to do |format|
      if @cms_domain.save
        format.html { redirect_to cms_domain_path(@cms_domain), notice: 'Domain was successfully created.' } #A此地@cms_domain修改为cms_domain_path(@cms_domain)
        format.json { render json: @cms_domain, status: :created, location: @cms_domain }
      else
        format.html { render action: "new" }
        format.json { render json: @cms_domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cms/domains/1
  # PUT /cms/domains/1.json
  def update
    @cms_domain = Domain.find(params[:id])

    respond_to do |format|
      if @cms_domain.update_attributes(params[:domain])#A此地cms_domain修改为domain
        format.html { redirect_to cms_domain_path, notice: 'Domain was successfully updated.' } #A此地@cms_domain修改为cms_domain_path
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @cms_domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cms/domains/1
  # DELETE /cms/domains/1.json
  def destroy
    @cms_domain = Domain.find(params[:id])
    @cms_domain.destroy

    respond_to do |format|
      format.html { redirect_to cms_domains_url }
      format.json { head :ok }
    end
  end
end
