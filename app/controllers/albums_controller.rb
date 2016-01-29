class AlbumsController < ApplicationController
  def new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      raise "hell"
    end
  end

  def edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      # flash.notice = "Band: '#{@band.name}' Updated!"
      redirect_to album_url(@album)
    else
      raise "hell"
    end
  end

  def destroy
    @album = Album.find(params[:id])
    if @album.destroy
      # flash.notice = "Band: '#{@band.name}' Updated!"
      redirect_to band_url(@album.band_id)
    else
      raise "hell"
    end
  end

  def album_params
    params.require(:album).permit(:name, :band_id)
  end
end
