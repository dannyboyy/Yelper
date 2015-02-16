class Business < ActiveRecord::Base
  searchkick
  belongs_to :user
  has_many :reviews, dependent: :destroy
  mount_uploader :image, ImageUploader

  # Needed for Geocoder, indicating which method returns business' geocodable address
  geocoded_by :address
  after_validation :geocode, if: ->(business){ business.address.present? and business.address_changed? }
end
