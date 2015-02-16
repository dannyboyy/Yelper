class Review < ActiveRecord::Base
  belongs_to :business
  belongs_to :user
  mount_uploader :image, ImageUploader
  
  acts_as_votable
end
