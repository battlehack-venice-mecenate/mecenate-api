class Poi < ActiveRecord::Base
  paginates_per 25
  validates :name, :lat, :lon, :presence => true
end
