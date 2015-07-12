class PoiSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image_url, :lat, :lon, :total_donations_in_cents, :target_in_cents
end
