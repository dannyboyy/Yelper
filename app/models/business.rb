class Business < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, dependent: :destroy

  # Needed for image upload using Paperclip
  has_attached_file :image, styles: { medium: "400x600#" }, default_url: "/images/style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  # Needed for Geocoder, indicating which method returns business' geocodable address
  geocoded_by :address
  after_validation :geocode, if: ->(business){ business.address.present? and business.address_changed? }
end
