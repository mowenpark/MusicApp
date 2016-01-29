class TracksController < ApplicationController
  def new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      raise "hell"
    end
  end

  def edit
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      # flash.notice = "Band: '#{@band.name}' Updated!"
      redirect_to album_url(@track.album_id)
    else
      raise "hell"
    end
  end

  def destroy
    @track = Track.find(params[:id])
    if @track.destroy
      # flash.notice = "Band: '#{@band.name}' Updated!"
      redirect_to album_url(@track.album_id)
    else
      raise "hell"
    end
  end

  def track_params
    params.require(:track).permit(:title, :album_id)
  end

end
