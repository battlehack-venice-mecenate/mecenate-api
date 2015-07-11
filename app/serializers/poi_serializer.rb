class PoiSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image_url, :lat, :lon
end
