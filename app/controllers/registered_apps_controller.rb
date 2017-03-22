class RegisteredAppsController < ApplicationController
  before_action :set_registered_app, only: [:show, :edit, :update, :destroy]

  # GET /registered_apps
  def index
    @registered_apps = RegisteredApp.all
  end

  # GET /registered_apps/1
  def show
  end

  # GET /registered_apps/new
  def new
    @registered_app = RegisteredApp.new
  end

  # GET /registered_apps/1/edit
  def edit
  end

  # POST /registered_apps
  def create
    @registered_app = RegisteredApp.new(registered_app_params)

    if @registered_app.save
      flash[:notice] = "\"#{@registered_app.name}\" was successfully added to your tracked apps."
      redirect_to @registered_app
    else
      flash[:notice] = "There was an error trying to save. Please try again."
      render :new
    end
  end

  # PATCH/PUT /registered_apps/1
  def update
    if @registered_app.update(registered_app_params)
      flash[:notice] = "\"#{@registered_app.name}\" was successfully updated."
      redirect_to @registered_app 
    else
      flash[:notice] = "There was an error saving your changes. Please try again."
      render :edit
    end
  end

  # DELETE /registered_apps/1
  def destroy
    if @registered_app.destroy
      flash[:notice] = "\"#{@registered_app.name}\" was successfully removed from tracked apps."
      redirect_to registered_apps_url
    else
      flash.now[:alert] = "There was an error trying to remove \"#{@registered_app.name}\""
      redirect_to registered_apps_url
    end
  end

  private
    def set_registered_app
      @registered_app = RegisteredApp.find(params[:id])
    end

    def registered_app_params
      params.require(:registered_app).permit(:name, :url)
    end
end
