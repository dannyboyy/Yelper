class Review < ActiveRecord::Base
  belongs_to :business
  belongs_to :user

  acts_as_votable
end
