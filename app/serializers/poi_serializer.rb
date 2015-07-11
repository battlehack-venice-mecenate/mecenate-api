class PoiSerializer < ActiveModel::Serializer
  attributes :name, :description, :image_url, :lat, :lon
end
