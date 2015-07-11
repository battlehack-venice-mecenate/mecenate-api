class PoisController < ApplicationController
  def index
    pois = Poi.order(:id).page(params[:page])
    render :json => pois, :meta => pagination_meta(pois), :each_serializer => PoiSerializer
  end

  def show
    poi = Poi.find(params[:id])
    render :json => poi
  end
end
