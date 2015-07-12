class PoisController < ApplicationController
  def index
    pois = Poi.order(:id).page(params[:page])
    render :json => pois, :meta => pagination_meta(pois), :each_serializer => PoiSerializer
  end

  def show
    poi = Poi.find(params[:id])
    render :json => poi
  end

  def create
    poi = Poi.new(poi_params)
    if poi.save
      render :json => poi
      return
    end

    render :json => {:errors => poi.errors.messages}, :status => 400
  end

  def update
    poi = Poi.find(params[:id])
    if poi.update(poi_update_params)
      render :json => poi
      return
    end

    render :json => {:errors => poi.errors.messages}, :status => 400
  end

  private

  def poi_params
    params.require(:name)
    params.require(:lat)
    params.require(:lon)
    params.require(:image_url)
    params.permit(:name, :description, :lat, :lon, :image_url, :target_in_cents)
  end

  def poi_update_params
    params.permit(:name, :description, :lat, :lon, :image_url, :target_in_cents)
  end
end
