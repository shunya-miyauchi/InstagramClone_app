class Picture < ApplicationRecord
  mount_uploader :image, PictureUploader

  belongs_to :user
  has_many :favorites, dependent: :destroy
end
