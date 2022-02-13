class Picture < ApplicationRecord
  mount_uploader :image, PictureUploader

  belongs_to :user
end
