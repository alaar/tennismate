class Court < ApplicationRecord
  has_many :matches
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def gmap_coordinates
    {
      lat: self.latitude,
      lng: self.longitude
    }.to_json
  end
end
