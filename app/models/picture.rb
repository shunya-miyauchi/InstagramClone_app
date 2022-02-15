class Picture < ApplicationRecord
  validates :image, presence: true
  validates :content, presence: true

  mount_uploader :image, PictureUploader

  belongs_to :user
  has_many :favorites, dependent: :destroy
end
