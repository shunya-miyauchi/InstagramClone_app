class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 30}
  validates :user_name,presence :true, length: {maximum:10}
  validates :email,presence: true,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
