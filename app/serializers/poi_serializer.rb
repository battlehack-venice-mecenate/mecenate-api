class PoiSerializer < ActiveModel::Serializer
  attributes :name, :description, :lat, :lon
end
