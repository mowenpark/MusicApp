class BandsController < ApplicationController
  def index
    render :index
  end

  def new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      raise "hell"
    end
  end

  def edit
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      # flash.notice = "Band: '#{@band.name}' Updated!"
      redirect_to bands_url
    else
      raise "hell"
    end
  end

  def destroy
  end

  def band_params
    params.require(:band).permit(:name)
  end

end
