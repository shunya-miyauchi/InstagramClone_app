class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 30}
  validates :user_name, presence: true, length: {maximum:10}
  validates :email,presence: true,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password,length: {minimum:6},on: :create

  before_validation {email.downcase!}
  has_secure_password

  mount_uploader :image , ImageUploader

  has_many :pictures
end