class VideosController < ApplicationController

  before_filter :authenticate_user!, :skip => [:index, :show]

  respond_to :html, :json, :js

  # GET /videos
  # GET /videos.json
  def index
    @videos = current_user.videos
    respond_with(@videos)
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @video = Video.find(params[:id])
    respond_with(@video)
  end

  # GET /videos/new
  # GET /videos/new.json
  def new
    @video = Video.new
    respond_with(@video)
  end

  # GET /videos/1/edit
  def edit
    @video = Video.find(params[:id])
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(params[:video])
    @video.user = current_user

    flash[:success] = 'Video was successfully created.' if @video.save
    respond_with(current_user,@video)
  end

  # PUT /videos/1
  # PUT /videos/1.json
  def update
    @video = Video.find(params[:id])

    flash[:success] = 'Video was successfully updated.' if @video.update_attributes(params[:video])
    respond_with(current_user,@video)
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    respond_to do |format|
      format.html { redirect_to user_videos_url(current_user) }
      format.json { head :no_content }
    end
  end
end
