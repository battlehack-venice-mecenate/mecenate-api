class Poi < ActiveRecord::Base
  paginates_per 25
  validates :name, :lat, :lon, :presence => true
  has_many :donations

  def total_donations_in_cents
    Donation.where(:poi_id => id).sum(:amount_in_cents)
  end
end
