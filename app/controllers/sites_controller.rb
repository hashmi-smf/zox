class SitesController < ApplicationController
before_action :set_lead, only: [:show, :edit, :update, :destroy]
  def index
    @sites = Site.all
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to sites_path, notice: "site was successfully created"
    else
      render :new
    end

  end

  def show
  end

  def edit
  end

  def update
    if @site.update(site_params)
      redirect_to sites_path, notice: "site was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @site.destroy
    redirect_to sites_url, notice: "site was successfully deleted"
  end

  private

  def set_site
      @site = Site.find(params[:id])
  end

  def site_params
     params.require(:site).permit(:name, :address)    
  end	
end
